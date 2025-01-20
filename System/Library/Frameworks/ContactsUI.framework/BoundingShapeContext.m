@interface BoundingShapeContext
- (_TtC10ContactsUI20BoundingShapeContext)init;
- (_TtC10ContactsUI20BoundingShapeContext)initWithContact:(id)a3 showName:(BOOL)a4;
- (_TtC10ContactsUI20BoundingShapeContext)initWithNameVariations:(id)a3 preferredNameStyle:(unint64_t)a4 horizontalTitleBoundingRect:(CGRect)a5 verticalTitleBoundingRect:(CGRect)a6 imageAssetID:(id)a7 personalPoster:(BOOL)a8;
@end

@implementation BoundingShapeContext

- (_TtC10ContactsUI20BoundingShapeContext)initWithNameVariations:(id)a3 preferredNameStyle:(unint64_t)a4 horizontalTitleBoundingRect:(CGRect)a5 verticalTitleBoundingRect:(CGRect)a6 imageAssetID:(id)a7 personalPoster:(BOOL)a8
{
  BOOL v8 = a8;
  double height = a6.size.height;
  double width = a6.size.width;
  double y = a6.origin.y;
  double x = a6.origin.x;
  double v13 = a5.size.height;
  double v14 = a5.size.width;
  double v15 = a5.origin.y;
  double v16 = a5.origin.x;
  if (a7)
  {
    sub_18B985E68();
    id v20 = a3;
    v21 = (void *)sub_18B985E38();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v22 = a3;
    v21 = 0;
  }
  v25.receiver = self;
  v25.super_class = (Class)type metadata accessor for BoundingShapeContext();
  v23 = -[CNPRUISIncomingCallPosterContext initWithNameVariations:preferredNameStyle:horizontalTitleBoundingRect:verticalTitleBoundingRect:imageAssetID:personalPoster:](&v25, sel_initWithNameVariations_preferredNameStyle_horizontalTitleBoundingRect_verticalTitleBoundingRect_imageAssetID_personalPoster_, a3, a4, v21, v8, v16, v15, v14, v13, x, y, width, height);

  return v23;
}

- (_TtC10ContactsUI20BoundingShapeContext)initWithContact:(id)a3 showName:(BOOL)a4
{
  BOOL v4 = a4;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for BoundingShapeContext();
  return [(CNPRUISIncomingCallPosterContext *)&v7 initWithContact:a3 showName:v4];
}

- (_TtC10ContactsUI20BoundingShapeContext)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for BoundingShapeContext();
  return [(BoundingShapeContext *)&v3 init];
}

@end