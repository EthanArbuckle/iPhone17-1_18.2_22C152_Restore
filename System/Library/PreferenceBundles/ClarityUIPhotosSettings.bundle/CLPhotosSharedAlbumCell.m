@interface CLPhotosSharedAlbumCell
- (CLPhotosSharedAlbumCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5;
@end

@implementation CLPhotosSharedAlbumCell

- (CLPhotosSharedAlbumCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  id v8 = a5;
  v14.receiver = self;
  v14.super_class = (Class)CLPhotosSharedAlbumCell;
  v9 = [(CLPhotosSharedAlbumCell *)&v14 initWithStyle:a3 reuseIdentifier:a4 specifier:v8];
  if (v9)
  {
    v10 = [v8 propertyForKey:@"sharedAlbumIdentifier"];
    v11 = +[CLPhotosInterfaceHelper createRowCellContentForSharedAlbum:v10];
    v12 = [v11 contentConfiguration];

    [(CLPhotosSharedAlbumCell *)v9 setContentConfiguration:v12];
  }

  return v9;
}

@end