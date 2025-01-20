@interface TransitDeparturesContainerSectionView
- (BOOL)verticalCardContainerView:(id)a3 shouldHighlightRowAtIndex:(int64_t)a4;
- (NSDirectionalEdgeInsets)_resolvedBottomSeparatorInsetsForView:(id)a3;
- (_TtC6MapsUI37TransitDeparturesContainerSectionView)initWithCoder:(id)a3;
- (_TtC6MapsUI37TransitDeparturesContainerSectionView)initWithConfiguration:(id)a3;
- (_TtC6MapsUI37TransitDeparturesContainerSectionView)initWithFrame:(CGRect)a3;
- (_TtC6MapsUI37TransitDeparturesContainerSectionView)initWithShowsSeparators:(BOOL)a3;
- (void)verticalCardContainerView:(id)a3 didSelectRow:(id)a4 atIndex:(int64_t)a5;
@end

@implementation TransitDeparturesContainerSectionView

- (void)verticalCardContainerView:(id)a3 didSelectRow:(id)a4 atIndex:(int64_t)a5
{
  id v7 = a3;
  id v8 = a4;
  v9 = self;
  sub_1931FD694(v8);
}

- (BOOL)verticalCardContainerView:(id)a3 shouldHighlightRowAtIndex:(int64_t)a4
{
  return a4 != 0;
}

- (NSDirectionalEdgeInsets)_resolvedBottomSeparatorInsetsForView:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  sub_1931F9204(0, &qword_1E930FC58);
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v7 = a3;
  id v8 = self;
  if (objc_msgSend(v7, sel_isKindOfClass_, ObjCClassFromMetadata))
  {
    double v9 = *MEMORY[0x1E4FB12A8];
    double v10 = *(double *)(MEMORY[0x1E4FB12A8] + 8);
    double v11 = *(double *)(MEMORY[0x1E4FB12A8] + 16);
    double v12 = *(double *)(MEMORY[0x1E4FB12A8] + 24);
  }
  else
  {
    v21.receiver = v8;
    v21.super_class = ObjectType;
    [(MUPlaceVerticalCardContainerView *)&v21 _resolvedBottomSeparatorInsetsForView:v7];
    double v9 = v13;
    double v10 = v14;
    double v11 = v15;
    double v12 = v16;
  }

  double v17 = v9;
  double v18 = v10;
  double v19 = v11;
  double v20 = v12;
  result.trailing = v20;
  result.bottom = v19;
  result.leading = v18;
  result.top = v17;
  return result;
}

- (_TtC6MapsUI37TransitDeparturesContainerSectionView)initWithConfiguration:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  *(void *)((char *)&self->super.super.super.super._responderFlags
            + OBJC_IVAR____TtC6MapsUI37TransitDeparturesContainerSectionView_rowFeedbackDelegate) = 0;
  swift_unknownObjectWeakInit();
  v6 = (char *)self + OBJC_IVAR____TtC6MapsUI37TransitDeparturesContainerSectionView_departuresContainer;
  *(_OWORD *)v6 = 0u;
  *((_OWORD *)v6 + 1) = 0u;
  *((void *)v6 + 4) = 0;
  v8.receiver = self;
  v8.super_class = ObjectType;
  return [(MUPlaceVerticalCardContainerView *)&v8 initWithConfiguration:a3];
}

- (_TtC6MapsUI37TransitDeparturesContainerSectionView)initWithShowsSeparators:(BOOL)a3
{
  BOOL v3 = a3;
  ObjectType = (objc_class *)swift_getObjectType();
  *(void *)((char *)&self->super.super.super.super._responderFlags
            + OBJC_IVAR____TtC6MapsUI37TransitDeparturesContainerSectionView_rowFeedbackDelegate) = 0;
  swift_unknownObjectWeakInit();
  v6 = (char *)self + OBJC_IVAR____TtC6MapsUI37TransitDeparturesContainerSectionView_departuresContainer;
  *(_OWORD *)v6 = 0u;
  *((_OWORD *)v6 + 1) = 0u;
  *((void *)v6 + 4) = 0;
  v8.receiver = self;
  v8.super_class = ObjectType;
  return [(MUPlaceVerticalCardContainerView *)&v8 initWithShowsSeparators:v3];
}

- (_TtC6MapsUI37TransitDeparturesContainerSectionView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  ObjectType = (objc_class *)swift_getObjectType();
  *(void *)((char *)&self->super.super.super.super._responderFlags
            + OBJC_IVAR____TtC6MapsUI37TransitDeparturesContainerSectionView_rowFeedbackDelegate) = 0;
  swift_unknownObjectWeakInit();
  double v9 = (char *)self + OBJC_IVAR____TtC6MapsUI37TransitDeparturesContainerSectionView_departuresContainer;
  *(_OWORD *)double v9 = 0u;
  *((_OWORD *)v9 + 1) = 0u;
  *((void *)v9 + 4) = 0;
  v11.receiver = self;
  v11.super_class = ObjectType;
  return -[MUStackView initWithFrame:](&v11, sel_initWithFrame_, x, y, width, height);
}

- (_TtC6MapsUI37TransitDeparturesContainerSectionView)initWithCoder:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  *(void *)((char *)&self->super.super.super.super._responderFlags
            + OBJC_IVAR____TtC6MapsUI37TransitDeparturesContainerSectionView_rowFeedbackDelegate) = 0;
  swift_unknownObjectWeakInit();
  v6 = (char *)self + OBJC_IVAR____TtC6MapsUI37TransitDeparturesContainerSectionView_departuresContainer;
  *(_OWORD *)v6 = 0u;
  *((_OWORD *)v6 + 1) = 0u;
  *((void *)v6 + 4) = 0;
  v8.receiver = self;
  v8.super_class = ObjectType;
  return [(TransitDeparturesContainerSectionView *)&v8 initWithCoder:a3];
}

- (void).cxx_destruct
{
}

@end