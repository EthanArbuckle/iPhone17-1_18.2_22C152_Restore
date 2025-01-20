@interface ANTrackPlayerInfo
- (ANTrackPlayerInfo)initWithPlayerItem:(id)a3 announcementID:(id)a4 trackType:(int64_t)a5;
- (AVPlayerItem)playerItem;
- (BOOL)completed;
- (NSString)announcementID;
- (id)description;
- (int64_t)trackType;
- (void)setCompleted:(BOOL)a3;
- (void)setPlayerItem:(id)a3;
@end

@implementation ANTrackPlayerInfo

- (ANTrackPlayerInfo)initWithPlayerItem:(id)a3 announcementID:(id)a4 trackType:(int64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)ANTrackPlayerInfo;
  v11 = [(ANTrackPlayerInfo *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_playerItem, a3);
    objc_storeStrong((id *)&v12->_announcementID, a4);
    v12->_trackType = a5;
    v12->_completed = 0;
  }

  return v12;
}

- (id)description
{
  v3 = NSString;
  v4 = [(ANTrackPlayerInfo *)self announcementID];
  v5 = [(ANTrackPlayerInfo *)self playerItem];
  v6 = [v3 stringWithFormat:@"AnnouncementID = %@, Player Item = %@, Track Type = %ld, completed = %d", v4, v5, -[ANTrackPlayerInfo trackType](self, "trackType"), -[ANTrackPlayerInfo completed](self, "completed")];

  return v6;
}

- (AVPlayerItem)playerItem
{
  return self->_playerItem;
}

- (void)setPlayerItem:(id)a3
{
}

- (NSString)announcementID
{
  return self->_announcementID;
}

- (int64_t)trackType
{
  return self->_trackType;
}

- (BOOL)completed
{
  return self->_completed;
}

- (void)setCompleted:(BOOL)a3
{
  self->_completed = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_announcementID, 0);
  objc_storeStrong((id *)&self->_playerItem, 0);
}

@end