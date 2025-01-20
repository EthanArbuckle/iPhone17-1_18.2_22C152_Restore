@interface MUCompositionalStackLayoutGroupInternal
- (BOOL)alignmentBoundsContent;
- (BOOL)alignmentBoundsContentForArrangedLayoutItem:(id)a3;
- (BOOL)distributionBoundsContent;
- (BOOL)hasAlignmentForArrangedLayoutItem:(id)a3;
- (MUCompositionalStackLayoutGroupInternal)init;
- (MUCompositionalStackLayoutGroupInternal)initWithAxis:(int64_t)a3;
- (MUCompositionalStackLayoutGroupInternal)initWithIdentifier:(id)a3 axis:(int64_t)a4;
- (NSArray)arrangedLayoutItems;
- (NSDirectionalEdgeInsets)insets;
- (NSDirectionalEdgeInsets)paddingForArrangedLayoutItem:(id)a3;
- (NSString)identifier;
- (UIOffset)offsetForArrangedLayoutItem:(id)a3;
- (double)spacing;
- (float)alignmentFittingSizePriority;
- (float)alignmentFittingSizePriorityForArrangedLayoutItem:(id)a3;
- (float)distributionFittingSizePriority;
- (id)copyWithZone:(void *)a3;
- (int64_t)alignment;
- (int64_t)alignmentForArrangedLayoutItem:(id)a3;
- (int64_t)axis;
- (int64_t)distribution;
- (void)addArrangedLayoutItem:(id)a3;
- (void)disableAlignmentForArrangedLayoutItem:(id)a3;
- (void)removeArrangedLayoutItem:(id)a3;
- (void)resetAlignmentForArrangedLayoutItem:(id)a3;
- (void)setAlignment:(int64_t)a3;
- (void)setAlignment:(int64_t)a3 forArrangedLayoutItem:(id)a4;
- (void)setAlignmentBoundsContent:(BOOL)a3;
- (void)setAlignmentBoundsContent:(BOOL)a3 forArrangedLayoutItem:(id)a4;
- (void)setAlignmentFittingSizePriority:(float)a3;
- (void)setAlignmentFittingSizePriority:(float)a3 forArrangedLayoutItem:(id)a4;
- (void)setArrangedLayoutItems:(id)a3;
- (void)setAxis:(int64_t)a3;
- (void)setDistribution:(int64_t)a3;
- (void)setDistributionBoundsContent:(BOOL)a3;
- (void)setDistributionFittingSizePriority:(float)a3;
- (void)setIdentifier:(id)a3;
- (void)setInsets:(NSDirectionalEdgeInsets)a3;
- (void)setOffset:(UIOffset)a3 forArrangedLayoutItem:(id)a4;
- (void)setPadding:(NSDirectionalEdgeInsets)a3 forArrangedLayoutItem:(id)a4;
- (void)setSpacing:(double)a3;
@end

@implementation MUCompositionalStackLayoutGroupInternal

- (MUCompositionalStackLayoutGroupInternal)initWithAxis:(int64_t)a3
{
  uint64_t ObjectType = swift_getObjectType();
  double v5 = sub_1932708CC(a3, (uint64_t)v8);
  v6 = (MUCompositionalStackLayoutGroupInternal *)(*(uint64_t (**)(unsigned char *, double))(ObjectType + 112))(v8, v5);
  swift_deallocPartialClassInstance();
  return v6;
}

- (MUCompositionalStackLayoutGroupInternal)initWithIdentifier:(id)a3 axis:(int64_t)a4
{
  uint64_t v5 = sub_1933413B0();
  uint64_t v7 = v6;
  uint64_t ObjectType = swift_getObjectType();
  int64x2_t v13 = vdupq_n_s64(0xC0000000uLL);
  long long v9 = *(_OWORD *)(MEMORY[0x1E4FB12A8] + 16);
  long long v15 = *MEMORY[0x1E4FB12A8];
  v12[0] = v5;
  v12[1] = v7;
  v12[2] = a4;
  v12[3] = MEMORY[0x1E4FBC860];
  uint64_t v14 = 0;
  long long v16 = v9;
  v10 = (MUCompositionalStackLayoutGroupInternal *)(*(uint64_t (**)(void *))(ObjectType + 112))(v12);
  swift_deallocPartialClassInstance();
  return v10;
}

- (id)copyWithZone:(void *)a3
{
  void (*v5)(void *__return_ptr);
  MUCompositionalStackLayoutGroupInternal *v6;
  void *v7;
  void *v8;
  void v10[11];

  uint64_t ObjectType = swift_getObjectType();
  uint64_t v5 = *(void (**)(void *__return_ptr))((*MEMORY[0x1E4FBC8C8] & (uint64_t)self->super.isa) + 0x58);
  uint64_t v6 = self;
  v5(v10);
  uint64_t v7 = (void *)(*(uint64_t (**)(void *))(ObjectType + 112))(v10);

  v8 = (void *)sub_193341850();
  return v8;
}

- (NSString)identifier
{
  void (*v2)(uint64_t *__return_ptr);
  MUCompositionalStackLayoutGroupInternal *v3;
  void *v4;
  uint64_t v6;
  uint64_t vars8;

  v2 = *(void (**)(uint64_t *__return_ptr))((*MEMORY[0x1E4FBC8C8] & (uint64_t)self->super.isa) + 0x58);
  v3 = self;
  v2(&v6);
  swift_bridgeObjectRetain();
  sub_193270BA0((uint64_t)&v6);

  v4 = (void *)sub_193341380();
  swift_bridgeObjectRelease();
  return (NSString *)v4;
}

- (void)setIdentifier:(id)a3
{
  uint64_t v4 = sub_1933413B0();
  uint64_t v6 = v5;
  uint64_t v7 = *(uint64_t (**)(unsigned char *))((*MEMORY[0x1E4FBC8C8] & (uint64_t)self->super.isa) + 0x68);
  v8 = self;
  long long v9 = (void (*)(unsigned char *, void))v7(v11);
  uint64_t *v10 = v4;
  v10[1] = v6;
  swift_bridgeObjectRelease();
  v9(v11, 0);
}

- (int64_t)axis
{
  void (*v2)(void *__return_ptr);
  MUCompositionalStackLayoutGroupInternal *v3;
  void v5[11];

  v2 = *(void (**)(void *__return_ptr))((*MEMORY[0x1E4FBC8C8] & (uint64_t)self->super.isa) + 0x58);
  v3 = self;
  v2(v5);
  sub_193270BA0((uint64_t)v5);

  return v5[2];
}

- (void)setAxis:(int64_t)a3
{
  uint64_t v4 = *(uint64_t (**)(unsigned char *))((*MEMORY[0x1E4FBC8C8] & (uint64_t)self->super.isa) + 0x68);
  uint64_t v5 = self;
  uint64_t v6 = (void (*)(unsigned char *, void))v4(v8);
  *(void *)(v7 + 16) = a3;
  v6(v8, 0);
}

- (int64_t)distribution
{
  void (*v2)(void *__return_ptr);
  MUCompositionalStackLayoutGroupInternal *v3;
  int64_t v4;
  void v6[11];

  v2 = *(void (**)(void *__return_ptr))((*MEMORY[0x1E4FBC8C8] & (uint64_t)self->super.isa) + 0x58);
  v3 = self;
  v2(v6);
  uint64_t v4 = sub_19325BD90(v6[4]);
  sub_193270BA0((uint64_t)v6);

  return v4;
}

- (void)setDistribution:(int64_t)a3
{
  uint64_t v4 = *(uint64_t (**)(unsigned char *))((*MEMORY[0x1E4FBC8C8] & (uint64_t)self->super.isa) + 0x68);
  uint64_t v5 = self;
  uint64_t v6 = (void (*)(unsigned char *, void))v4(v7);
  sub_19325BE10(a3);
  v6(v7, 0);
}

- (BOOL)distributionBoundsContent
{
  void (*v2)(void *__return_ptr);
  MUCompositionalStackLayoutGroupInternal *v3;
  void v5[4];
  uint64_t v6;

  v2 = *(void (**)(void *__return_ptr))((*MEMORY[0x1E4FBC8C8] & (uint64_t)self->super.isa) + 0x58);
  v3 = self;
  v2(v5);
  LOBYTE(v2) = sub_19325C35C(v6);
  sub_193270BA0((uint64_t)v5);

  return v2 & 1;
}

- (void)setDistributionBoundsContent:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v4 = *(uint64_t (**)(unsigned char *))((*MEMORY[0x1E4FBC8C8] & (uint64_t)self->super.isa) + 0x68);
  uint64_t v5 = self;
  uint64_t v6 = (void (*)(unsigned char *, void))v4(v7);
  sub_19325C3AC(v3);
  v6(v7, 0);
}

- (float)distributionFittingSizePriority
{
  void (*v2)(void *__return_ptr);
  MUCompositionalStackLayoutGroupInternal *v3;
  float v4;
  void v6[11];

  v2 = *(void (**)(void *__return_ptr))((*MEMORY[0x1E4FBC8C8] & (uint64_t)self->super.isa) + 0x58);
  BOOL v3 = self;
  v2(v6);
  uint64_t v4 = sub_19325C308(v6[4]);
  sub_193270BA0((uint64_t)v6);

  return v4;
}

- (void)setDistributionFittingSizePriority:(float)a3
{
  uint64_t v4 = *(uint64_t (**)(unsigned char *))((*MEMORY[0x1E4FBC8C8] & (uint64_t)self->super.isa) + 0x68);
  uint64_t v5 = self;
  uint64_t v6 = (void (*)(unsigned char *, void))v4(v7);
  sub_19325C4D4(a3);
  v6(v7, 0);
}

- (int64_t)alignment
{
  void (*v2)(void *__return_ptr);
  MUCompositionalStackLayoutGroupInternal *v3;
  int64_t v4;
  void v6[5];
  uint64_t v7;

  v2 = *(void (**)(void *__return_ptr))((*MEMORY[0x1E4FBC8C8] & (uint64_t)self->super.isa) + 0x58);
  BOOL v3 = self;
  v2(v6);
  uint64_t v4 = sub_19325C03C(v7);
  sub_193270BA0((uint64_t)v6);

  return v4;
}

- (void)setAlignment:(int64_t)a3
{
  uint64_t v4 = *(uint64_t (**)(unsigned char *))((*MEMORY[0x1E4FBC8C8] & (uint64_t)self->super.isa) + 0x68);
  uint64_t v5 = self;
  uint64_t v6 = (void (*)(unsigned char *, void))v4(v7);
  sub_19325C050(a3);
  v6(v7, 0);
}

- (BOOL)alignmentBoundsContent
{
  void (*v2)(void *__return_ptr);
  MUCompositionalStackLayoutGroupInternal *v3;
  void v5[5];
  uint64_t v6;

  v2 = *(void (**)(void *__return_ptr))((*MEMORY[0x1E4FBC8C8] & (uint64_t)self->super.isa) + 0x58);
  BOOL v3 = self;
  v2(v5);
  LOBYTE(v2) = sub_19325C6C0(v6);
  sub_193270BA0((uint64_t)v5);

  return v2 & 1;
}

- (void)setAlignmentBoundsContent:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v4 = *(uint64_t (**)(unsigned char *))((*MEMORY[0x1E4FBC8C8] & (uint64_t)self->super.isa) + 0x68);
  uint64_t v5 = self;
  uint64_t v6 = (void (*)(unsigned char *, void))v4(v7);
  sub_19325C704(v3);
  v6(v7, 0);
}

- (float)alignmentFittingSizePriority
{
  void (*v2)(void *__return_ptr);
  MUCompositionalStackLayoutGroupInternal *v3;
  float v4;
  void v6[11];

  v2 = *(void (**)(void *__return_ptr))((*MEMORY[0x1E4FBC8C8] & (uint64_t)self->super.isa) + 0x58);
  BOOL v3 = self;
  v2(v6);
  uint64_t v4 = sub_19325C678(v6[5]);
  sub_193270BA0((uint64_t)v6);

  return v4;
}

- (void)setAlignmentFittingSizePriority:(float)a3
{
  uint64_t v4 = *(uint64_t (**)(unsigned char *))((*MEMORY[0x1E4FBC8C8] & (uint64_t)self->super.isa) + 0x68);
  uint64_t v5 = self;
  uint64_t v6 = (void (*)(unsigned char *, void))v4(v7);
  sub_19325C7A4(a3);
  v6(v7, 0);
}

- (double)spacing
{
  void (*v2)(void *__return_ptr);
  MUCompositionalStackLayoutGroupInternal *v3;
  void v5[11];

  v2 = *(void (**)(void *__return_ptr))((*MEMORY[0x1E4FBC8C8] & (uint64_t)self->super.isa) + 0x58);
  BOOL v3 = self;
  v2(v5);
  sub_193270BA0((uint64_t)v5);

  return *(double *)&v5[6];
}

- (void)setSpacing:(double)a3
{
  uint64_t v4 = *(uint64_t (**)(unsigned char *))((*MEMORY[0x1E4FBC8C8] & (uint64_t)self->super.isa) + 0x68);
  uint64_t v5 = self;
  uint64_t v6 = (void (*)(unsigned char *, void))v4(v8);
  *(double *)(v7 + 48) = a3;
  v6(v8, 0);
}

- (NSDirectionalEdgeInsets)insets
{
  void (*v2)(void *__return_ptr);
  MUCompositionalStackLayoutGroupInternal *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void v8[11];
  NSDirectionalEdgeInsets result;

  v2 = *(void (**)(void *__return_ptr))((*MEMORY[0x1E4FBC8C8] & (uint64_t)self->super.isa) + 0x58);
  BOOL v3 = self;
  v2(v8);
  sub_193270BA0((uint64_t)v8);

  uint64_t v4 = *(double *)&v8[7];
  uint64_t v5 = *(double *)&v8[8];
  uint64_t v6 = *(double *)&v8[9];
  uint64_t v7 = *(double *)&v8[10];
  result.trailing = v7;
  result.bottom = v6;
  result.leading = v5;
  result.top = v4;
  return result;
}

- (void)setInsets:(NSDirectionalEdgeInsets)a3
{
  CGFloat trailing = a3.trailing;
  CGFloat bottom = a3.bottom;
  CGFloat leading = a3.leading;
  CGFloat top = a3.top;
  uint64_t v7 = *(uint64_t (**)(unsigned char *))((*MEMORY[0x1E4FBC8C8] & (uint64_t)self->super.isa) + 0x68);
  v8 = self;
  long long v9 = (void (*)(unsigned char *, void))v7(v11);
  v10[7] = top;
  v10[8] = leading;
  v10[9] = bottom;
  v10[10] = trailing;
  v9(v11, 0);
}

- (NSArray)arrangedLayoutItems
{
  v2 = self;
  CompositionalStackLayout.GroupRef.arrangedLayoutItems.getter();

  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB4F6E98);
  BOOL v3 = (void *)sub_193341450();
  swift_bridgeObjectRelease();
  return (NSArray *)v3;
}

- (void)setArrangedLayoutItems:(id)a3
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB4F6E98);
  unint64_t v4 = sub_193341460();
  uint64_t v5 = self;
  CompositionalStackLayout.GroupRef.arrangedLayoutItems.setter(v4);
}

- (void)addArrangedLayoutItem:(id)a3
{
}

- (void)removeArrangedLayoutItem:(id)a3
{
}

- (NSDirectionalEdgeInsets)paddingForArrangedLayoutItem:(id)a3
{
  swift_unknownObjectRetain();
  uint64_t v5 = self;
  sub_19326E9F0((uint64_t)a3, &v17);
  if (v18)
  {
    double v6 = v19;
    uint64_t v7 = (double *)&v20;
    v8 = (double *)&v21;
    long long v9 = (double *)&v22;
  }
  else
  {
    long long v9 = (double *)(MEMORY[0x1E4FB12A8] + 24);
    v8 = (double *)(MEMORY[0x1E4FB12A8] + 16);
    uint64_t v7 = (double *)(MEMORY[0x1E4FB12A8] + 8);
    double v6 = *MEMORY[0x1E4FB12A8];
  }
  double v10 = *v9;
  double v11 = *v8;
  double v12 = *v7;
  sub_1931FD82C((uint64_t)&v17, (uint64_t *)&unk_1EB4F6D88);
  swift_unknownObjectRelease();

  double v13 = v6;
  double v14 = v12;
  double v15 = v11;
  double v16 = v10;
  result.CGFloat trailing = v16;
  result.CGFloat bottom = v15;
  result.CGFloat leading = v14;
  result.CGFloat top = v13;
  return result;
}

- (void)setPadding:(NSDirectionalEdgeInsets)a3 forArrangedLayoutItem:(id)a4
{
  CGFloat trailing = a3.trailing;
  CGFloat bottom = a3.bottom;
  CGFloat leading = a3.leading;
  CGFloat top = a3.top;
  swift_unknownObjectRetain();
  double v10 = self;
  double v12 = sub_19326F184(v13, (uint64_t)a4);
  if (*((void *)v11 + 3))
  {
    v11[5] = top;
    v11[6] = leading;
    v11[7] = bottom;
    v11[8] = trailing;
  }
  v12(v13, 0);

  swift_unknownObjectRelease();
}

- (UIOffset)offsetForArrangedLayoutItem:(id)a3
{
  swift_unknownObjectRetain();
  uint64_t v5 = self;
  sub_19326E9F0((uint64_t)a3, &v10);
  if (v11) {
    double v6 = v12;
  }
  else {
    double v6 = *MEMORY[0x1E4FB2E10];
  }
  if (v11) {
    double v7 = v13;
  }
  else {
    double v7 = *(double *)(MEMORY[0x1E4FB2E10] + 8);
  }
  sub_1931FD82C((uint64_t)&v10, (uint64_t *)&unk_1EB4F6D88);
  swift_unknownObjectRelease();

  double v8 = v6;
  double v9 = v7;
  result.vertical = v9;
  result.horizontal = v8;
  return result;
}

- (void)setOffset:(UIOffset)a3 forArrangedLayoutItem:(id)a4
{
  CGFloat vertical = a3.vertical;
  CGFloat horizontal = a3.horizontal;
  swift_unknownObjectRetain();
  double v8 = self;
  long long v10 = sub_19326F184(v11, (uint64_t)a4);
  if (*((void *)v9 + 3))
  {
    v9[9] = horizontal;
    v9[10] = vertical;
  }
  v10(v11, 0);

  swift_unknownObjectRelease();
}

- (BOOL)hasAlignmentForArrangedLayoutItem:(id)a3
{
  swift_unknownObjectRetain();
  uint64_t v5 = self;
  sub_19326E9F0((uint64_t)a3, &v9);
  if (v10)
  {
    uint64_t v6 = v12;
    uint64_t v7 = sub_1931FD82C((uint64_t)&v9, (uint64_t *)&unk_1EB4F6D88);
    (*(void (**)(long long *__return_ptr, uint64_t))((*MEMORY[0x1E4FBC8C8] & (uint64_t)v5->super.isa) + 0x58))(&v9, v7);
    sub_193270BA0((uint64_t)&v9);
    LODWORD(v6) = ~sub_19325BD6C(v11, v6);
    swift_unknownObjectRelease();

    return (v6 & 0xFFFFFFFE) != 0;
  }
  else
  {
    sub_1931FD82C((uint64_t)&v9, (uint64_t *)&unk_1EB4F6D88);
    swift_unknownObjectRelease();

    return 0;
  }
}

- (void)disableAlignmentForArrangedLayoutItem:(id)a3
{
}

- (void)resetAlignmentForArrangedLayoutItem:(id)a3
{
}

- (int64_t)alignmentForArrangedLayoutItem:(id)a3
{
  swift_unknownObjectRetain();
  uint64_t v5 = self;
  int64_t v6 = CompositionalStackLayout.GroupRef.alignmentKind(forArrangedLayoutItem:)((uint64_t)a3);
  swift_unknownObjectRelease();

  return v6;
}

- (void)setAlignment:(int64_t)a3 forArrangedLayoutItem:(id)a4
{
  swift_unknownObjectRetain();
  uint64_t v7 = self;
  CompositionalStackLayout.GroupRef.setAlignmentKind(_:forArrangedLayoutItem:)(a3, (uint64_t)a4);
  swift_unknownObjectRelease();
}

- (BOOL)alignmentBoundsContentForArrangedLayoutItem:(id)a3
{
  swift_unknownObjectRetain();
  uint64_t v5 = self;
  char v6 = CompositionalStackLayout.GroupRef.alignmentBoundsContent(forArrangedLayoutItem:)((uint64_t)a3);
  swift_unknownObjectRelease();

  return v6 & 1;
}

- (void)setAlignmentBoundsContent:(BOOL)a3 forArrangedLayoutItem:(id)a4
{
  swift_unknownObjectRetain();
  uint64_t v7 = self;
  CompositionalStackLayout.GroupRef.setAlignmentBoundsContent(_:forArrangedLayoutItem:)(a3, (uint64_t)a4);
  swift_unknownObjectRelease();
}

- (float)alignmentFittingSizePriorityForArrangedLayoutItem:(id)a3
{
  swift_unknownObjectRetain();
  uint64_t v5 = self;
  double v6 = CompositionalStackLayout.GroupRef.alignmentFittingSizePriority(forArrangedLayoutItem:)((uint64_t)a3);
  float v7 = *(float *)&v6;
  swift_unknownObjectRelease();

  return v7;
}

- (void)setAlignmentFittingSizePriority:(float)a3 forArrangedLayoutItem:(id)a4
{
  swift_unknownObjectRetain();
  float v7 = self;
  CompositionalStackLayout.GroupRef.setAlignmentFittingSizePriority(_:forArrangedLayoutItem:)((uint64_t)a4, a3);
  swift_unknownObjectRelease();
}

- (MUCompositionalStackLayoutGroupInternal)init
{
  UIOffset result = (MUCompositionalStackLayoutGroupInternal *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end