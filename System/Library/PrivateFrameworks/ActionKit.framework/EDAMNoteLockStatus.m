@interface EDAMNoteLockStatus
+ (id)structFields;
+ (id)structName;
- (NSArray)viewingUserIds;
- (NSDictionary)unknownUsers;
- (NSNumber)currentTime;
- (NSNumber)lockHolderUserId;
- (NSNumber)lockRenewBy;
- (NSNumber)noteUpdateSequenceNumber;
- (NSNumber)viewIdleExpiration;
- (void)setCurrentTime:(id)a3;
- (void)setLockHolderUserId:(id)a3;
- (void)setLockRenewBy:(id)a3;
- (void)setNoteUpdateSequenceNumber:(id)a3;
- (void)setUnknownUsers:(id)a3;
- (void)setViewIdleExpiration:(id)a3;
- (void)setViewingUserIds:(id)a3;
@end

@implementation EDAMNoteLockStatus

+ (id)structFields
{
  v16[7] = *MEMORY[0x263EF8340];
  v2 = (void *)structFields_structFields_1473;
  if (!structFields_structFields_1473)
  {
    v15 = +[FATField fieldWithIndex:1 type:8 optional:0 name:@"noteUpdateSequenceNumber"];
    v16[0] = v15;
    v3 = +[FATField fieldWithIndex:2 type:8 optional:1 name:@"lockHolderUserId"];
    v16[1] = v3;
    v4 = +[FATField fieldWithIndex:3 type:10 optional:1 name:@"lockRenewBy"];
    v16[2] = v4;
    v5 = +[FATField fieldWithIndex:0 type:8 optional:1 name:0];
    v6 = +[FATField fieldWithIndex:4 type:15 optional:1 name:@"viewingUserIds" valueField:v5];
    v16[3] = v6;
    v7 = +[FATField fieldWithIndex:5 type:8 optional:1 name:@"viewIdleExpiration"];
    v16[4] = v7;
    v8 = +[FATField fieldWithIndex:0 type:8 optional:1 name:0];
    v9 = +[FATField fieldWithIndex:0 type:12 optional:1 name:0 structClass:objc_opt_class()];
    v10 = +[FATField fieldWithIndex:6 type:13 optional:1 name:@"unknownUsers" keyField:v8 valueField:v9];
    v16[5] = v10;
    v11 = +[FATField fieldWithIndex:7 type:10 optional:1 name:@"currentTime"];
    v16[6] = v11;
    uint64_t v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:7];
    v13 = (void *)structFields_structFields_1473;
    structFields_structFields_1473 = v12;

    v2 = (void *)structFields_structFields_1473;
  }
  return v2;
}

+ (id)structName
{
  return @"NoteLockStatus";
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentTime, 0);
  objc_storeStrong((id *)&self->_unknownUsers, 0);
  objc_storeStrong((id *)&self->_viewIdleExpiration, 0);
  objc_storeStrong((id *)&self->_viewingUserIds, 0);
  objc_storeStrong((id *)&self->_lockRenewBy, 0);
  objc_storeStrong((id *)&self->_lockHolderUserId, 0);
  objc_storeStrong((id *)&self->_noteUpdateSequenceNumber, 0);
}

- (void)setCurrentTime:(id)a3
{
}

- (NSNumber)currentTime
{
  return self->_currentTime;
}

- (void)setUnknownUsers:(id)a3
{
}

- (NSDictionary)unknownUsers
{
  return self->_unknownUsers;
}

- (void)setViewIdleExpiration:(id)a3
{
}

- (NSNumber)viewIdleExpiration
{
  return self->_viewIdleExpiration;
}

- (void)setViewingUserIds:(id)a3
{
}

- (NSArray)viewingUserIds
{
  return self->_viewingUserIds;
}

- (void)setLockRenewBy:(id)a3
{
}

- (NSNumber)lockRenewBy
{
  return self->_lockRenewBy;
}

- (void)setLockHolderUserId:(id)a3
{
}

- (NSNumber)lockHolderUserId
{
  return self->_lockHolderUserId;
}

- (void)setNoteUpdateSequenceNumber:(id)a3
{
}

- (NSNumber)noteUpdateSequenceNumber
{
  return self->_noteUpdateSequenceNumber;
}

@end