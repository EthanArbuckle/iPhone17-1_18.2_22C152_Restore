@interface DOCColumnLayout
- (BOOL)flipsHorizontallyInOppositeLayoutDirection;
- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3;
- (_TtC11SaveToFilesP33_3C485232E0B5B230D0CCD8D5BC512DB615DOCColumnLayout)init;
- (_TtC11SaveToFilesP33_3C485232E0B5B230D0CCD8D5BC512DB615DOCColumnLayout)initWithCoder:(id)a3;
@end

@implementation DOCColumnLayout

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v7 = self;
  char v8 = sub_1000F8124(x, y, width, height);

  return v8 & 1;
}

- (BOOL)flipsHorizontallyInOppositeLayoutDirection
{
  return 1;
}

- (_TtC11SaveToFilesP33_3C485232E0B5B230D0CCD8D5BC512DB615DOCColumnLayout)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for DOCColumnLayout();
  return [(DOCColumnLayout *)&v3 init];
}

- (_TtC11SaveToFilesP33_3C485232E0B5B230D0CCD8D5BC512DB615DOCColumnLayout)initWithCoder:(id)a3
{
  return (_TtC11SaveToFilesP33_3C485232E0B5B230D0CCD8D5BC512DB615DOCColumnLayout *)sub_1000F8384(self, (uint64_t)a2, (uint64_t)a3, 0, (uint64_t (*)(uint64_t))type metadata accessor for DOCColumnLayout);
}

@end