@interface GDGraphSongRelationship
- (GDGraphEntityIdentifier)songId;
- (GDGraphSongRelationship)initWithSongIdField:(id)a3 allSongIdField:(id)a4;
- (NSArray)allSongId;
@end

@implementation GDGraphSongRelationship

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allSongId, 0);

  objc_storeStrong((id *)&self->_songId, 0);
}

- (NSArray)allSongId
{
  return self->_allSongId;
}

- (GDGraphEntityIdentifier)songId
{
  return self->_songId;
}

- (GDGraphSongRelationship)initWithSongIdField:(id)a3 allSongIdField:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)GDGraphSongRelationship;
  v9 = [(GDGraphSongRelationship *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_songId, a3);
    objc_storeStrong((id *)&v10->_allSongId, a4);
  }

  return v10;
}

@end