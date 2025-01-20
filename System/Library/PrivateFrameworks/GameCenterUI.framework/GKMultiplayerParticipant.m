@interface GKMultiplayerParticipant
+ (id)allStatuses;
+ (id)stringFromGKMultiplayerParticipantStatus:(int64_t)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isPlaceHolderItem;
- (BOOL)isSharePlayInvitee;
- (GKMultiplayerParticipant)init;
- (GKPlayer)player;
- (NSString)statusName;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)number;
- (int64_t)status;
- (int64_t)type;
- (unint64_t)hash;
- (void)setIsPlaceHolderItem:(BOOL)a3;
- (void)setNumber:(int64_t)a3;
- (void)setPlayer:(id)a3;
- (void)setStatus:(int64_t)a3;
- (void)setType:(int64_t)a3;
@end

@implementation GKMultiplayerParticipant

- (GKMultiplayerParticipant)init
{
  v3.receiver = self;
  v3.super_class = (Class)GKMultiplayerParticipant;
  result = [(GKMultiplayerParticipant *)&v3 init];
  if (result) {
    result->_status = 7;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (GKMultiplayerParticipant *)a3;
  if (self == v4)
  {
    char v10 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      int64_t type = self->_type;
      if (type == [(GKMultiplayerParticipant *)v5 type]
        && (int64_t status = self->_status, status == [(GKMultiplayerParticipant *)v5 status]))
      {
        player = self->_player;
        v9 = [(GKMultiplayerParticipant *)v5 player];
        char v10 = [(GKPlayer *)player isEqual:v9];
      }
      else
      {
        char v10 = 0;
      }
    }
    else
    {
      char v10 = 0;
    }
  }

  return v10;
}

- (unint64_t)hash
{
  int64_t v2 = self->_status ^ self->_type;
  return v2 ^ [(GKPlayer *)self->_player hash];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(GKMultiplayerParticipant);
  [(GKMultiplayerParticipant *)v4 setType:self->_type];
  [(GKMultiplayerParticipant *)v4 setPlayer:self->_player];
  [(GKMultiplayerParticipant *)v4 setStatus:self->_status];
  [(GKMultiplayerParticipant *)v4 setNumber:self->_number];
  return v4;
}

- (NSString)statusName
{
  int64_t v2 = [(GKMultiplayerParticipant *)self status];

  return (NSString *)+[GKMultiplayerParticipant stringFromGKMultiplayerParticipantStatus:v2];
}

- (id)description
{
  int64_t type = self->_type;
  switch(type)
  {
    case 2:
      goto LABEL_4;
    case 1:
      v7 = @"Automatch";
      break;
    case 0:
LABEL_4:
      v4 = NSString;
      player = self->_player;
      v6 = [(GKMultiplayerParticipant *)self statusName];
      [v4 stringWithFormat:@" player = %@, int64_t status = %@", player, v6];
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();

      break;
    default:
      v7 = @"Add";
      break;
  }
  v11.receiver = self;
  v11.super_class = (Class)GKMultiplayerParticipant;
  v8 = [(GKMultiplayerParticipant *)&v11 description];
  v9 = [v8 stringByAppendingString:v7];

  return v9;
}

+ (id)stringFromGKMultiplayerParticipantStatus:(int64_t)a3
{
  if ((unint64_t)a3 > 0x15) {
    return @"Unknown";
  }
  else {
    return off_1E5F63EE8[a3];
  }
}

+ (id)allStatuses
{
  return &unk_1F08126A0;
}

- (BOOL)isSharePlayInvitee
{
  int64_t v2 = [(GKMultiplayerParticipant *)self player];
  objc_super v3 = [v2 tuParticipant];
  BOOL v4 = v3 != 0;

  return v4;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_int64_t type = a3;
}

- (int64_t)status
{
  return self->_status;
}

- (void)setStatus:(int64_t)a3
{
  self->_int64_t status = a3;
}

- (GKPlayer)player
{
  return self->_player;
}

- (void)setPlayer:(id)a3
{
}

- (int64_t)number
{
  return self->_number;
}

- (void)setNumber:(int64_t)a3
{
  self->_number = a3;
}

- (BOOL)isPlaceHolderItem
{
  return self->_isPlaceHolderItem;
}

- (void)setIsPlaceHolderItem:(BOOL)a3
{
  self->_isPlaceHolderItem = a3;
}

- (void).cxx_destruct
{
}

@end