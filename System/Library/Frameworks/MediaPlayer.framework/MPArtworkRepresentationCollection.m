@interface MPArtworkRepresentationCollection
+ (MPArtworkRepresentationCollection)collectionWithImageRepresentation:(id)a3 videoRepresentation:(id)a4;
+ (MPArtworkRepresentationCollection)collectionWithImageRepresentation:(id)a3 videoRepresentation:(id)a4 bestRepresentationKinds:(unint64_t)a5;
- (BOOL)isBestRepresentationForKind:(int64_t)a3;
- (MPArtworkRepresentation)imageRepresentation;
- (MPArtworkRepresentation)videoRepresentation;
- (unint64_t)bestRepresentationKinds;
- (void)resetForRepresentationKinds:(unint64_t)a3;
- (void)setBestRepresentationKinds:(unint64_t)a3;
- (void)setImageRepresentation:(id)a3;
- (void)setVideoRepresentation:(id)a3;
@end

@implementation MPArtworkRepresentationCollection

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_videoRepresentation, 0);

  objc_storeStrong((id *)&self->_imageRepresentation, 0);
}

+ (MPArtworkRepresentationCollection)collectionWithImageRepresentation:(id)a3 videoRepresentation:(id)a4 bestRepresentationKinds:(unint64_t)a5
{
  id v7 = a4;
  id v8 = a3;
  v9 = objc_alloc_init(MPArtworkRepresentationCollection);
  [(MPArtworkRepresentationCollection *)v9 setImageRepresentation:v8];

  [(MPArtworkRepresentationCollection *)v9 setVideoRepresentation:v7];
  [(MPArtworkRepresentationCollection *)v9 setBestRepresentationKinds:a5];

  return v9;
}

- (void)setBestRepresentationKinds:(unint64_t)a3
{
  self->_bestRepresentationKinds = a3;
}

- (void)setImageRepresentation:(id)a3
{
}

- (void)setVideoRepresentation:(id)a3
{
}

- (MPArtworkRepresentation)imageRepresentation
{
  return self->_imageRepresentation;
}

- (void)resetForRepresentationKinds:(unint64_t)a3
{
  char v3 = a3;
  if (a3)
  {
    [(MPArtworkRepresentationCollection *)self setImageRepresentation:0];
    [(MPArtworkRepresentationCollection *)self setBestRepresentationKinds:[(MPArtworkRepresentationCollection *)self bestRepresentationKinds] & 0xFFFFFFFFFFFFFFFELL];
  }
  if ((v3 & 2) != 0)
  {
    [(MPArtworkRepresentationCollection *)self setVideoRepresentation:0];
    unint64_t v5 = [(MPArtworkRepresentationCollection *)self bestRepresentationKinds] & 0xFFFFFFFFFFFFFFFDLL;
    [(MPArtworkRepresentationCollection *)self setBestRepresentationKinds:v5];
  }
}

- (unint64_t)bestRepresentationKinds
{
  return self->_bestRepresentationKinds;
}

- (MPArtworkRepresentation)videoRepresentation
{
  return self->_videoRepresentation;
}

- (BOOL)isBestRepresentationForKind:(int64_t)a3
{
  return ((1 << a3) & ~[(MPArtworkRepresentationCollection *)self bestRepresentationKinds]) == 0;
}

+ (MPArtworkRepresentationCollection)collectionWithImageRepresentation:(id)a3 videoRepresentation:(id)a4
{
  return (MPArtworkRepresentationCollection *)[a1 collectionWithImageRepresentation:a3 videoRepresentation:a4 bestRepresentationKinds:3];
}

@end