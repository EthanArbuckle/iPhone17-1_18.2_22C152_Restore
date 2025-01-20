@interface _BlastDoorLPGameCenterInvitationMetadata
+ (BOOL)supportsSecureCoding;
+ (id)keyPathsForValuesAffecting_dummyPropertyForObservation;
- (BOOL)isEqual:(id)a3;
- (NSString)game;
- (_BlastDoorLPGameCenterInvitationMetadata)initWithCoder:(id)a3;
- (_BlastDoorLPImage)icon;
- (_BlastDoorLPImage)image;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (unsigned)maximumNumberOfPlayers;
- (unsigned)minimumNumberOfPlayers;
- (unsigned)numberOfPlayers;
- (void)_enumerateAsynchronousFields:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setGame:(id)a3;
- (void)setIcon:(id)a3;
- (void)setImage:(id)a3;
- (void)setMaximumNumberOfPlayers:(unsigned int)a3;
- (void)setMinimumNumberOfPlayers:(unsigned int)a3;
- (void)setNumberOfPlayers:(unsigned int)a3;
@end

@implementation _BlastDoorLPGameCenterInvitationMetadata

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_BlastDoorLPGameCenterInvitationMetadata)initWithCoder:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)_BlastDoorLPGameCenterInvitationMetadata;
  v5 = [(_BlastDoorLPGameCenterInvitationMetadata *)&v14 init];
  if (v5)
  {
    uint64_t v6 = decodeStringForKey(v4, @"game");
    v7 = *(void **)&v5->_maximumNumberOfPlayers;
    *(void *)&v5->_maximumNumberOfPlayers = v6;

    *((_DWORD *)&v5->super.__dummyPropertyForObservation + 1) = [v4 decodeInt32ForKey:@"numberOfPlayers"];
    v5->_numberOfPlayers = [v4 decodeInt32ForKey:@"minimumNumberOfPlayers"];
    v5->_minimumNumberOfPlayers = [v4 decodeInt32ForKey:@"maximumNumberOfPlayers"];
    uint64_t v8 = objc_msgSend(v4, "_bd_lp_strictlyDecodeLPImageForKey:", @"image");
    game = v5->_game;
    v5->_game = (NSString *)v8;

    uint64_t v10 = objc_msgSend(v4, "_bd_lp_strictlyDecodeLPImageForKey:", @"icon");
    image = v5->_image;
    v5->_image = (_BlastDoorLPImage *)v10;

    v12 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v4 = *(void *)&self->_maximumNumberOfPlayers;
  id v5 = a3;
  objc_msgSend(v5, "_bd_lp_encodeObjectIfNotNil:forKey:", v4, @"game");
  [v5 encodeInt32:*((unsigned int *)&self->super.__dummyPropertyForObservation + 1) forKey:@"numberOfPlayers"];
  [v5 encodeInt32:self->_numberOfPlayers forKey:@"minimumNumberOfPlayers"];
  [v5 encodeInt32:self->_minimumNumberOfPlayers forKey:@"maximumNumberOfPlayers"];
  objc_msgSend(v5, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_game, @"image");
  objc_msgSend(v5, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_image, @"icon");
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = +[_BlastDoorLPGameCenterInvitationMetadata allocWithZone:a3];
  if (v4)
  {
    id v5 = [(_BlastDoorLPGameCenterInvitationMetadata *)self game];
    [(_BlastDoorLPGameCenterInvitationMetadata *)v4 setGame:v5];

    [(_BlastDoorLPGameCenterInvitationMetadata *)v4 setNumberOfPlayers:[(_BlastDoorLPGameCenterInvitationMetadata *)self numberOfPlayers]];
    [(_BlastDoorLPGameCenterInvitationMetadata *)v4 setMinimumNumberOfPlayers:[(_BlastDoorLPGameCenterInvitationMetadata *)self minimumNumberOfPlayers]];
    [(_BlastDoorLPGameCenterInvitationMetadata *)v4 setMaximumNumberOfPlayers:[(_BlastDoorLPGameCenterInvitationMetadata *)self maximumNumberOfPlayers]];
    uint64_t v6 = [(_BlastDoorLPGameCenterInvitationMetadata *)self image];
    [(_BlastDoorLPGameCenterInvitationMetadata *)v4 setImage:v6];

    v7 = [(_BlastDoorLPGameCenterInvitationMetadata *)self icon];
    [(_BlastDoorLPGameCenterInvitationMetadata *)v4 setIcon:v7];

    uint64_t v8 = v4;
  }

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_BlastDoorLPGameCenterInvitationMetadata;
  if ([(_BlastDoorLPGameCenterInvitationMetadata *)&v11 isEqual:v4])
  {
    char v5 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v6 = v4;
      unint64_t v7 = v6[3];
      if ((!(v7 | *(void *)&self->_maximumNumberOfPlayers) || objc_msgSend((id)v7, "isEqual:"))
        && *((_DWORD *)v6 + 3) == *((_DWORD *)&self->super.__dummyPropertyForObservation + 1)
        && *((_DWORD *)v6 + 4) == self->_numberOfPlayers
        && *((_DWORD *)v6 + 5) == self->_minimumNumberOfPlayers
        && ((unint64_t v8 = v6[4], !(v8 | (unint64_t)self->_game)) || objc_msgSend((id)v8, "isEqual:")))
      {
        unint64_t v9 = v6[5];
        if (v9 | (unint64_t)self->_image) {
          char v5 = objc_msgSend((id)v9, "isEqual:");
        }
        else {
          char v5 = 1;
        }
      }
      else
      {
        char v5 = 0;
      }
    }
    else
    {
      char v5 = 0;
    }
  }

  return v5;
}

- (unint64_t)hash
{
  return [*(id *)&self->_maximumNumberOfPlayers hash];
}

- (void)_enumerateAsynchronousFields:(id)a3
{
  v3 = (void (**)(id, __CFString *))((char *)a3 + 16);
  id v4 = (void (*)(void))*((void *)a3 + 2);
  id v5 = a3;
  v4();
  (*v3)(v5, @"icon");
}

+ (id)keyPathsForValuesAffecting_dummyPropertyForObservation
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"game", @"numberOfPlayers", @"minimumNumberOfPlayers", @"maximumNumberOfPlayers", @"image", @"icon", 0);
}

- (NSString)game
{
  return *(NSString **)&self->_maximumNumberOfPlayers;
}

- (void)setGame:(id)a3
{
}

- (_BlastDoorLPImage)image
{
  return (_BlastDoorLPImage *)self->_game;
}

- (void)setImage:(id)a3
{
}

- (_BlastDoorLPImage)icon
{
  return self->_image;
}

- (void)setIcon:(id)a3
{
}

- (unsigned)numberOfPlayers
{
  return *((_DWORD *)&self->super.__dummyPropertyForObservation + 1);
}

- (void)setNumberOfPlayers:(unsigned int)a3
{
  *((_DWORD *)&self->super.__dummyPropertyForObservation + 1) = a3;
}

- (unsigned)minimumNumberOfPlayers
{
  return self->_numberOfPlayers;
}

- (void)setMinimumNumberOfPlayers:(unsigned int)a3
{
  self->_numberOfPlayers = a3;
}

- (unsigned)maximumNumberOfPlayers
{
  return self->_minimumNumberOfPlayers;
}

- (void)setMaximumNumberOfPlayers:(unsigned int)a3
{
  self->_minimumNumberOfPlayers = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_game, 0);
  objc_storeStrong((id *)&self->_maximumNumberOfPlayers, 0);
}

@end