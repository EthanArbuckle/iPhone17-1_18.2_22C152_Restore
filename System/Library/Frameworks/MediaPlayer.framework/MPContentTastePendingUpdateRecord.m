@interface MPContentTastePendingUpdateRecord
- (MPContentTastePendingUpdateRecord)initWithPlaylistGlobalID:(id)a3 tasteType:(int64_t)a4;
- (MPContentTastePendingUpdateRecord)initWithStoreAdamID:(int64_t)a3 tasteType:(int64_t)a4;
- (NSString)playlistGlobalID;
- (NSUUID)UUID;
- (int64_t)storeAdamID;
- (int64_t)tasteType;
- (int64_t)type;
- (void)_initializeWithType:(int64_t)a3 tasteType:(int64_t)a4;
@end

@implementation MPContentTastePendingUpdateRecord

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_UUID, 0);

  objc_storeStrong((id *)&self->_playlistGlobalID, 0);
}

- (NSUUID)UUID
{
  return self->_UUID;
}

- (int64_t)type
{
  return self->_type;
}

- (int64_t)tasteType
{
  return self->_tasteType;
}

- (int64_t)storeAdamID
{
  return self->_storeAdamID;
}

- (NSString)playlistGlobalID
{
  return self->_playlistGlobalID;
}

- (void)_initializeWithType:(int64_t)a3 tasteType:(int64_t)a4
{
  self->_tasteType = a4;
  self->_type = a3;
  v5 = [MEMORY[0x1E4F29128] UUID];
  UUID = self->_UUID;
  self->_UUID = v5;
}

- (MPContentTastePendingUpdateRecord)initWithStoreAdamID:(int64_t)a3 tasteType:(int64_t)a4
{
  v9.receiver = self;
  v9.super_class = (Class)MPContentTastePendingUpdateRecord;
  v6 = [(MPContentTastePendingUpdateRecord *)&v9 init];
  v7 = v6;
  if (v6)
  {
    [(MPContentTastePendingUpdateRecord *)v6 _initializeWithType:1 tasteType:a4];
    v7->_storeAdamID = a3;
  }
  return v7;
}

- (MPContentTastePendingUpdateRecord)initWithPlaylistGlobalID:(id)a3 tasteType:(int64_t)a4
{
  id v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MPContentTastePendingUpdateRecord;
  v7 = [(MPContentTastePendingUpdateRecord *)&v12 init];
  v8 = v7;
  if (v7)
  {
    [(MPContentTastePendingUpdateRecord *)v7 _initializeWithType:0 tasteType:a4];
    uint64_t v9 = [v6 copy];
    playlistGlobalID = v8->_playlistGlobalID;
    v8->_playlistGlobalID = (NSString *)v9;
  }
  return v8;
}

@end