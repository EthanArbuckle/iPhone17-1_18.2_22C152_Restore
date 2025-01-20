@interface CLPhotosInterfaceHelper
+ (id)createRowCellContentForSharedAlbum:(id)a3;
- (_TtC23ClarityUIPhotosSettings23CLPhotosInterfaceHelper)init;
@end

@implementation CLPhotosInterfaceHelper

+ (id)createRowCellContentForSharedAlbum:(id)a3
{
  id v4 = objc_allocWithZone((Class)UITableViewCell);
  id v5 = a3;
  id v6 = [v4 init];
  v8[3] = sub_6158(&qword_10900);
  v8[4] = sub_619C();
  sub_6240(v8);
  type metadata accessor for CLPhotosSharedAlbumRow();
  sub_62A4();
  sub_9120();
  sub_92B0();

  return v6;
}

- (_TtC23ClarityUIPhotosSettings23CLPhotosInterfaceHelper)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CLPhotosInterfaceHelper();
  return [(CLPhotosInterfaceHelper *)&v3 init];
}

@end