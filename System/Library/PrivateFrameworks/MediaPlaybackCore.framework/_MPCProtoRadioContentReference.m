@interface _MPCProtoRadioContentReference
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)writeTo:(id)a3;
@end

@implementation _MPCProtoRadioContentReference

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storeContentReference, 0);
  objc_storeStrong((id *)&self->_libraryItemContentReference, 0);
  objc_storeStrong((id *)&self->_libraryArtistContentReference, 0);

  objc_storeStrong((id *)&self->_libraryAlbumContentReference, 0);
}

- (unint64_t)hash
{
  unint64_t v3 = [(_MPCProtoRadioContentReferenceLibraryAlbumContentReference *)self->_libraryAlbumContentReference hash];
  unint64_t v4 = [(_MPCProtoRadioContentReferenceLibraryArtistContentReference *)self->_libraryArtistContentReference hash] ^ v3;
  unint64_t v5 = [(_MPCProtoRadioContentReferenceLibraryItemContentReference *)self->_libraryItemContentReference hash];
  return v4 ^ v5 ^ [(_MPCProtoRadioContentReferenceStoreContentReference *)self->_storeContentReference hash];
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((libraryAlbumContentReference = self->_libraryAlbumContentReference,
         !((unint64_t)libraryAlbumContentReference | v4[1]))
     || -[_MPCProtoRadioContentReferenceLibraryAlbumContentReference isEqual:](libraryAlbumContentReference, "isEqual:"))
    && ((libraryArtistContentReference = self->_libraryArtistContentReference,
         !((unint64_t)libraryArtistContentReference | v4[2]))
     || -[_MPCProtoRadioContentReferenceLibraryArtistContentReference isEqual:](libraryArtistContentReference, "isEqual:"))&& ((libraryItemContentReference = self->_libraryItemContentReference, !((unint64_t)libraryItemContentReference | v4[3]))|| -[_MPCProtoRadioContentReferenceLibraryItemContentReference isEqual:](libraryItemContentReference, "isEqual:")))
  {
    storeContentReference = self->_storeContentReference;
    if ((unint64_t)storeContentReference | v4[4]) {
      char v9 = -[_MPCProtoRadioContentReferenceStoreContentReference isEqual:](storeContentReference, "isEqual:");
    }
    else {
      char v9 = 1;
    }
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(_MPCProtoRadioContentReferenceLibraryAlbumContentReference *)self->_libraryAlbumContentReference copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  id v8 = [(_MPCProtoRadioContentReferenceLibraryArtistContentReference *)self->_libraryArtistContentReference copyWithZone:a3];
  char v9 = (void *)v5[2];
  v5[2] = v8;

  id v10 = [(_MPCProtoRadioContentReferenceLibraryItemContentReference *)self->_libraryItemContentReference copyWithZone:a3];
  v11 = (void *)v5[3];
  v5[3] = v10;

  id v12 = [(_MPCProtoRadioContentReferenceStoreContentReference *)self->_storeContentReference copyWithZone:a3];
  v13 = (void *)v5[4];
  v5[4] = v12;

  return v5;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_libraryAlbumContentReference)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_libraryArtistContentReference)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_libraryItemContentReference)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_storeContentReference)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
}

- (BOOL)readFrom:(id)a3
{
  return _MPCProtoRadioContentReferenceReadFrom((id *)&self->super.super.isa, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  unint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
  libraryAlbumContentReference = self->_libraryAlbumContentReference;
  if (libraryAlbumContentReference)
  {
    id v5 = [(_MPCProtoRadioContentReferenceLibraryAlbumContentReference *)libraryAlbumContentReference dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"libraryAlbumContentReference"];
  }
  libraryArtistContentReference = self->_libraryArtistContentReference;
  if (libraryArtistContentReference)
  {
    v7 = [(_MPCProtoRadioContentReferenceLibraryArtistContentReference *)libraryArtistContentReference dictionaryRepresentation];
    [v3 setObject:v7 forKey:@"libraryArtistContentReference"];
  }
  libraryItemContentReference = self->_libraryItemContentReference;
  if (libraryItemContentReference)
  {
    char v9 = [(_MPCProtoRadioContentReferenceLibraryItemContentReference *)libraryItemContentReference dictionaryRepresentation];
    [v3 setObject:v9 forKey:@"libraryItemContentReference"];
  }
  storeContentReference = self->_storeContentReference;
  if (storeContentReference)
  {
    v11 = [(_MPCProtoRadioContentReferenceStoreContentReference *)storeContentReference dictionaryRepresentation];
    [v3 setObject:v11 forKey:@"storeContentReference"];
  }

  return v3;
}

- (id)description
{
  unint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)_MPCProtoRadioContentReference;
  id v4 = [(_MPCProtoRadioContentReference *)&v8 description];
  id v5 = [(_MPCProtoRadioContentReference *)self dictionaryRepresentation];
  id v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

@end