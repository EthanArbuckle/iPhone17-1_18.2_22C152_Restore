@interface EDAMClientSyncRateConfig
+ (id)structFields;
+ (id)structName;
- (NSNumber)syncStateIntervalMillis;
- (NSNumber)updateNoteDuringEditIntervalMillis;
- (NSNumber)updateNoteWhenIdleForMillis;
- (void)setSyncStateIntervalMillis:(id)a3;
- (void)setUpdateNoteDuringEditIntervalMillis:(id)a3;
- (void)setUpdateNoteWhenIdleForMillis:(id)a3;
@end

@implementation EDAMClientSyncRateConfig

+ (id)structFields
{
  v9[3] = *MEMORY[0x263EF8340];
  v2 = (void *)structFields_structFields;
  if (!structFields_structFields)
  {
    v3 = +[FATField fieldWithIndex:1 type:10 optional:1 name:@"syncStateIntervalMillis"];
    v4 = +[FATField fieldWithIndex:2, 10, 1, @"updateNoteWhenIdleForMillis", v3 type optional name];
    v9[1] = v4;
    v5 = +[FATField fieldWithIndex:3 type:10 optional:1 name:@"updateNoteDuringEditIntervalMillis"];
    v9[2] = v5;
    uint64_t v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:3];
    v7 = (void *)structFields_structFields;
    structFields_structFields = v6;

    v2 = (void *)structFields_structFields;
  }
  return v2;
}

+ (id)structName
{
  return @"ClientSyncRateConfig";
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updateNoteDuringEditIntervalMillis, 0);
  objc_storeStrong((id *)&self->_updateNoteWhenIdleForMillis, 0);
  objc_storeStrong((id *)&self->_syncStateIntervalMillis, 0);
}

- (void)setUpdateNoteDuringEditIntervalMillis:(id)a3
{
}

- (NSNumber)updateNoteDuringEditIntervalMillis
{
  return self->_updateNoteDuringEditIntervalMillis;
}

- (void)setUpdateNoteWhenIdleForMillis:(id)a3
{
}

- (NSNumber)updateNoteWhenIdleForMillis
{
  return self->_updateNoteWhenIdleForMillis;
}

- (void)setSyncStateIntervalMillis:(id)a3
{
}

- (NSNumber)syncStateIntervalMillis
{
  return self->_syncStateIntervalMillis;
}

@end