@interface _CPPhotosAttributes
- (BOOL)isEmbeddingMatched;
- (BOOL)isEqual:(id)a3;
- (BOOL)isFavorite;
- (BOOL)isMetadataMatched;
- (BOOL)isVideo;
- (BOOL)readFrom:(id)a3;
- (_CPPhotosAttributes)initWithFacade:(id)a3;
- (int)photosSuggestionType;
- (unint64_t)hash;
- (unint64_t)positionIndex;
- (void)setIsEmbeddingMatched:(BOOL)a3;
- (void)setIsFavorite:(BOOL)a3;
- (void)setIsMetadataMatched:(BOOL)a3;
- (void)setIsVideo:(BOOL)a3;
- (void)setPhotosSuggestionType:(int)a3;
- (void)setPositionIndex:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation _CPPhotosAttributes

- (void)setPhotosSuggestionType:(int)a3
{
  self->_photosSuggestionType = a3;
}

- (int)photosSuggestionType
{
  return self->_photosSuggestionType;
}

- (void)setIsFavorite:(BOOL)a3
{
  self->_isFavorite = a3;
}

- (BOOL)isFavorite
{
  return self->_isFavorite;
}

- (void)setIsVideo:(BOOL)a3
{
  self->_isVideo = a3;
}

- (BOOL)isVideo
{
  return self->_isVideo;
}

- (void)setIsMetadataMatched:(BOOL)a3
{
  self->_isMetadataMatched = a3;
}

- (BOOL)isMetadataMatched
{
  return self->_isMetadataMatched;
}

- (void)setIsEmbeddingMatched:(BOOL)a3
{
  self->_isEmbeddingMatched = a3;
}

- (BOOL)isEmbeddingMatched
{
  return self->_isEmbeddingMatched;
}

- (void)setPositionIndex:(unint64_t)a3
{
  self->_positionIndex = a3;
}

- (unint64_t)positionIndex
{
  return self->_positionIndex;
}

- (unint64_t)hash
{
  return (2654435761 * self->_isEmbeddingMatched) ^ (2654435761 * self->_isMetadataMatched) ^ (2654435761u
                                                                                                 * self->_positionIndex) ^ (2654435761 * self->_isVideo) ^ (2654435761 * self->_isFavorite) ^ (2654435761 * self->_photosSuggestionType);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && (unint64_t positionIndex = self->_positionIndex, positionIndex == [v4 positionIndex])
    && (int isEmbeddingMatched = self->_isEmbeddingMatched,
        isEmbeddingMatched == [v4 isEmbeddingMatched])
    && (int isMetadataMatched = self->_isMetadataMatched,
        isMetadataMatched == [v4 isMetadataMatched])
    && (int isVideo = self->_isVideo, isVideo == [v4 isVideo])
    && (int isFavorite = self->_isFavorite, isFavorite == [v4 isFavorite]))
  {
    int photosSuggestionType = self->_photosSuggestionType;
    BOOL v11 = photosSuggestionType == [v4 photosSuggestionType];
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (void)writeTo:(id)a3
{
  a3;
  if ([(_CPPhotosAttributes *)self positionIndex]) {
    PBDataWriterWriteUint64Field();
  }
  if ([(_CPPhotosAttributes *)self isEmbeddingMatched]) {
    PBDataWriterWriteBOOLField();
  }
  if ([(_CPPhotosAttributes *)self isMetadataMatched]) {
    PBDataWriterWriteBOOLField();
  }
  if ([(_CPPhotosAttributes *)self isVideo]) {
    PBDataWriterWriteBOOLField();
  }
  if ([(_CPPhotosAttributes *)self isFavorite]) {
    PBDataWriterWriteBOOLField();
  }
  if ([(_CPPhotosAttributes *)self photosSuggestionType]) {
    PBDataWriterWriteInt32Field();
  }

  MEMORY[0x1F4181820]();
}

- (BOOL)readFrom:(id)a3
{
  return _CPPhotosAttributesReadFrom(self, (uint64_t)a3);
}

- (_CPPhotosAttributes)initWithFacade:(id)a3
{
  id v4 = a3;
  v5 = [(_CPPhotosAttributes *)self init];
  if (v5)
  {
    -[_CPPhotosAttributes setPositionIndex:](v5, "setPositionIndex:", [v4 positionIndex]);
    -[_CPPhotosAttributes setIsEmbeddingMatched:](v5, "setIsEmbeddingMatched:", [v4 isEmbeddingMatched]);
    -[_CPPhotosAttributes setIsMetadataMatched:](v5, "setIsMetadataMatched:", [v4 isMetadataMatched]);
    -[_CPPhotosAttributes setIsVideo:](v5, "setIsVideo:", [v4 isVideo]);
    -[_CPPhotosAttributes setIsFavorite:](v5, "setIsFavorite:", [v4 isFavorite]);
    v6 = v5;
  }

  return v5;
}

@end