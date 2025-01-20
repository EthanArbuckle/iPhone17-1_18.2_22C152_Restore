@interface MusicKit_SoftLinking_CoverArtworkToken
- (MusicKit_SoftLinking_CoverArtworkRecipe)coverArtworkRecipe;
- (MusicKit_SoftLinking_CoverArtworkToken)initWithCoverArtworkRecipe:(id)a3 playlistName:(id)a4;
- (NSString)playlistName;
- (NSString)stringRepresentation;
@end

@implementation MusicKit_SoftLinking_CoverArtworkToken

- (MusicKit_SoftLinking_CoverArtworkToken)initWithCoverArtworkRecipe:(id)a3 playlistName:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MusicKit_SoftLinking_CoverArtworkToken;
  v9 = [(MusicKit_SoftLinking_CoverArtworkToken *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_coverArtworkRecipe, a3);
    objc_storeStrong((id *)&v10->_playlistName, a4);
  }

  return v10;
}

- (NSString)stringRepresentation
{
  v3 = NSString;
  v4 = [(MusicKit_SoftLinking_CoverArtworkRecipe *)self->_coverArtworkRecipe stringRepresentation];
  v5 = [v3 stringWithFormat:@"rawCoverArtworkRecipe: %@, playlistName: %@", v4, self->_playlistName];

  return (NSString *)v5;
}

- (MusicKit_SoftLinking_CoverArtworkRecipe)coverArtworkRecipe
{
  return self->_coverArtworkRecipe;
}

- (NSString)playlistName
{
  return self->_playlistName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playlistName, 0);

  objc_storeStrong((id *)&self->_coverArtworkRecipe, 0);
}

@end