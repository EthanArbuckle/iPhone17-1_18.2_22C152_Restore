@interface LPGameCenterInvitationMetadata
+ (BOOL)supportsSecureCoding;
+ (id)keyPathsForValuesAffecting_dummyPropertyForObservation;
- (BOOL)canGeneratePresentationPropertiesForURL:(id)a3;
- (BOOL)isEqual:(id)a3;
- (LPGameCenterInvitationMetadata)initWithCoder:(id)a3;
- (LPImage)icon;
- (LPImage)image;
- (NSString)game;
- (id)copyWithZone:(_NSZone *)a3;
- (id)invitationText;
- (id)playerCountText;
- (id)presentationPropertiesForTransformer:(id)a3;
- (id)previewImageForTransformer:(id)a3;
- (id)previewSummaryForTransformer:(id)a3;
- (unint64_t)hash;
- (unsigned)maximumNumberOfPlayers;
- (unsigned)minimumNumberOfPlayers;
- (unsigned)numberOfPlayers;
- (void)_enumerateAsynchronousFields:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)populateMetadataForBackwardCompatibility:(id)a3;
- (void)setGame:(id)a3;
- (void)setIcon:(id)a3;
- (void)setImage:(id)a3;
- (void)setMaximumNumberOfPlayers:(unsigned int)a3;
- (void)setMinimumNumberOfPlayers:(unsigned int)a3;
- (void)setNumberOfPlayers:(unsigned int)a3;
@end

@implementation LPGameCenterInvitationMetadata

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (LPGameCenterInvitationMetadata)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)LPGameCenterInvitationMetadata;
  v5 = [(LPGameCenterInvitationMetadata *)&v14 init];
  if (v5)
  {
    uint64_t v6 = decodeStringForKey(v4, @"game");
    v7 = *(void **)&v5->_maximumNumberOfPlayers;
    *(void *)&v5->_maximumNumberOfPlayers = v6;

    *(_DWORD *)(&v5->super.__disallowsURLOverrideByDelegate + 2) = [v4 decodeInt32ForKey:@"numberOfPlayers"];
    v5->_numberOfPlayers = [v4 decodeInt32ForKey:@"minimumNumberOfPlayers"];
    v5->_minimumNumberOfPlayers = [v4 decodeInt32ForKey:@"maximumNumberOfPlayers"];
    uint64_t v8 = objc_msgSend(v4, "_lp_strictlyDecodeLPImageForKey:", @"image");
    game = v5->_game;
    v5->_game = (NSString *)v8;

    uint64_t v10 = objc_msgSend(v4, "_lp_strictlyDecodeLPImageForKey:", @"icon");
    image = v5->_image;
    v5->_image = (LPImage *)v10;

    v12 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "_lp_encodeStringIfNotNil:forKey:", *(void *)&self->_maximumNumberOfPlayers, @"game");
  [v4 encodeInt32:*(unsigned int *)(&self->super.__disallowsURLOverrideByDelegate + 2) forKey:@"numberOfPlayers"];
  [v4 encodeInt32:self->_numberOfPlayers forKey:@"minimumNumberOfPlayers"];
  [v4 encodeInt32:self->_minimumNumberOfPlayers forKey:@"maximumNumberOfPlayers"];
  objc_msgSend(v4, "_lp_encodeObjectIfNotNil:forKey:", self->_game, @"image");
  objc_msgSend(v4, "_lp_encodeObjectIfNotNil:forKey:", self->_image, @"icon");
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[LPGameCenterInvitationMetadata allocWithZone:a3];
  if (v4)
  {
    v5 = [(LPGameCenterInvitationMetadata *)self game];
    [(LPGameCenterInvitationMetadata *)v4 setGame:v5];

    [(LPGameCenterInvitationMetadata *)v4 setNumberOfPlayers:[(LPGameCenterInvitationMetadata *)self numberOfPlayers]];
    [(LPGameCenterInvitationMetadata *)v4 setMinimumNumberOfPlayers:[(LPGameCenterInvitationMetadata *)self minimumNumberOfPlayers]];
    [(LPGameCenterInvitationMetadata *)v4 setMaximumNumberOfPlayers:[(LPGameCenterInvitationMetadata *)self maximumNumberOfPlayers]];
    uint64_t v6 = [(LPGameCenterInvitationMetadata *)self image];
    [(LPGameCenterInvitationMetadata *)v4 setImage:v6];

    v7 = [(LPGameCenterInvitationMetadata *)self icon];
    [(LPGameCenterInvitationMetadata *)v4 setIcon:v7];

    uint64_t v8 = v4;
  }

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)LPGameCenterInvitationMetadata;
  if ([(LPGameCenterInvitationMetadata *)&v8 isEqual:v4])
  {
    char v5 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v6 = (void **)v4;
      if ((objectsAreEqual_0(v6[3], *(void **)&self->_maximumNumberOfPlayers) & 1) != 0
        && *((_DWORD *)v6 + 3) == *(_DWORD *)(&self->super.__disallowsURLOverrideByDelegate + 2)
        && *((_DWORD *)v6 + 4) == self->_numberOfPlayers
        && *((_DWORD *)v6 + 5) == self->_minimumNumberOfPlayers
        && objectsAreEqual_0(v6[4], self->_game))
      {
        char v5 = objectsAreEqual_0(v6[5], self->_image);
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
  v3 = (void (**)(id, __CFString *))a3;
  v3[2](v3, @"image");
  v3[2](v3, @"icon");
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

- (LPImage)image
{
  return (LPImage *)self->_game;
}

- (void)setImage:(id)a3
{
}

- (LPImage)icon
{
  return self->_image;
}

- (void)setIcon:(id)a3
{
}

- (unsigned)numberOfPlayers
{
  return *(_DWORD *)(&self->super.__disallowsURLOverrideByDelegate + 2);
}

- (void)setNumberOfPlayers:(unsigned int)a3
{
  *(_DWORD *)(&self->super.__disallowsURLOverrideByDelegate + 2) = a3;
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

- (id)invitationText
{
  v3 = NSString;
  id v4 = LPLocalizedString(@"Invitation to play %@");
  char v5 = [(LPGameCenterInvitationMetadata *)self game];
  uint64_t v6 = objc_msgSend(v3, "stringWithFormat:", v4, v5);

  return v6;
}

- (id)playerCountText
{
  if ([(LPGameCenterInvitationMetadata *)self minimumNumberOfPlayers]
    && [(LPGameCenterInvitationMetadata *)self maximumNumberOfPlayers])
  {
    v3 = NSString;
    id v4 = LPLocalizedString(@"%d-%d Players");
    uint64_t v5 = objc_msgSend(v3, "localizedStringWithFormat:", v4, -[LPGameCenterInvitationMetadata minimumNumberOfPlayers](self, "minimumNumberOfPlayers"), -[LPGameCenterInvitationMetadata maximumNumberOfPlayers](self, "maximumNumberOfPlayers"));
  }
  else
  {
    uint64_t v6 = NSString;
    id v4 = LPLocalizedString(@"%d Player(s)");
    uint64_t v5 = objc_msgSend(v6, "localizedStringWithFormat:", v4, -[LPGameCenterInvitationMetadata numberOfPlayers](self, "numberOfPlayers"));
  }
  v7 = (void *)v5;

  return v7;
}

- (id)presentationPropertiesForTransformer:(id)a3
{
  id v4 = [a3 commonPresentationPropertiesForStyle:17];
  uint64_t v5 = [(LPGameCenterInvitationMetadata *)self image];
  [v4 setImage:v5];

  uint64_t v6 = objc_alloc_init(LPCaptionBarPresentationProperties);
  [v4 setCaptionBar:v6];

  v7 = [(LPGameCenterInvitationMetadata *)self invitationText];
  objc_super v8 = [v4 captionBar];
  v9 = [v8 top];
  uint64_t v10 = [v9 leading];
  [v10 setText:v7];

  v11 = [(LPGameCenterInvitationMetadata *)self playerCountText];
  v12 = [v4 captionBar];
  v13 = [v12 bottom];
  objc_super v14 = [v13 leading];
  [v14 setText:v11];

  v15 = objc_alloc_init(LPCaptionBarPresentationProperties);
  [v4 setMediaTopCaptionBar:v15];

  v16 = [(LPGameCenterInvitationMetadata *)self icon];
  v17 = [v4 mediaTopCaptionBar];
  [v17 setLeadingIcon:v16];

  return v4;
}

- (BOOL)canGeneratePresentationPropertiesForURL:(id)a3
{
  return +[LPPresentationSpecializations isiCloudURL:a3];
}

- (id)previewSummaryForTransformer:(id)a3
{
  id v4 = NSString;
  uint64_t v5 = LPLocalizedString(@"%@.\n%@");
  uint64_t v6 = [(LPGameCenterInvitationMetadata *)self invitationText];
  v7 = [(LPGameCenterInvitationMetadata *)self playerCountText];
  objc_super v8 = objc_msgSend(v4, "stringWithFormat:", v5, v6, v7);

  return v8;
}

- (id)previewImageForTransformer:(id)a3
{
  return 0;
}

- (void)populateMetadataForBackwardCompatibility:(id)a3
{
  id v10 = a3;
  id v4 = NSString;
  uint64_t v5 = LPLocalizedString(@"Invitation to play %@");
  uint64_t v6 = [(LPGameCenterInvitationMetadata *)self game];
  v7 = objc_msgSend(v4, "stringWithFormat:", v5, v6);
  [v10 setTitle:v7];

  objc_super v8 = [(LPGameCenterInvitationMetadata *)self image];
  [v10 setImage:v8];

  v9 = [(LPGameCenterInvitationMetadata *)self icon];
  [v10 setIcon:v9];
}

@end