@interface MFLivePreviewView
+ (Class)layerClass;
- (BOOL)_accessibilityUseAccessibilityFrameForHittest;
- (BOOL)accessibilityPerformEscape;
- (NSString)accessibilityLabel;
- (_TtC16MagnifierSupport17MFLivePreviewView)initWithCoder:(id)a3;
- (_TtC16MagnifierSupport17MFLivePreviewView)initWithFrame:(CGRect)a3;
- (id)accessibilityExpandedTextValue;
- (uint64_t)_accessibilityMediaAnalysisOptions;
@end

@implementation MFLivePreviewView

+ (Class)layerClass
{
  sub_2356FEBE4();
  return (Class)swift_getObjCClassFromMetadata();
}

- (NSString)accessibilityLabel
{
  sub_2356EFDD4();
  if (v2)
  {
    v3 = (void *)sub_235949A88();
    swift_bridgeObjectRelease();
  }
  else
  {
    v3 = 0;
  }
  return (NSString *)v3;
}

- (BOOL)accessibilityPerformEscape
{
  sub_2356FE558();
  return v2 & 1;
}

- (BOOL)_accessibilityUseAccessibilityFrameForHittest
{
  return 1;
}

- (id)accessibilityExpandedTextValue
{
  swift_bridgeObjectRetain();
  char v2 = (void *)sub_235949A88();
  swift_bridgeObjectRelease();
  return v2;
}

- (_TtC16MagnifierSupport17MFLivePreviewView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  ObjectType = (objc_class *)swift_getObjectType();
  v9 = (Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC16MagnifierSupport17MFLivePreviewView_textValue);
  void *v9 = 0;
  v9[1] = 0xE000000000000000;
  v11.receiver = self;
  v11.super_class = ObjectType;
  return -[MFLivePreviewView initWithFrame:](&v11, sel_initWithFrame_, x, y, width, height);
}

- (_TtC16MagnifierSupport17MFLivePreviewView)initWithCoder:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  v6 = (Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC16MagnifierSupport17MFLivePreviewView_textValue);
  void *v6 = 0;
  v6[1] = 0xE000000000000000;
  v8.receiver = self;
  v8.super_class = ObjectType;
  return [(MFLivePreviewView *)&v8 initWithCoder:a3];
}

- (void).cxx_destruct
{
}

- (uint64_t)_accessibilityMediaAnalysisOptions
{
  int v0 = unk_26E8BDBBC;
  if ((unk_26E8BDBBC & ~dword_26E8BDBB8) == 0) {
    int v0 = 0;
  }
  int v1 = v0 | dword_26E8BDBB8;
  int v2 = dword_26E8BDBC0;
  if ((dword_26E8BDBC0 & ~v1) == 0) {
    int v2 = 0;
  }
  int v3 = v2 | v1;
  if ((unk_26E8BDBC4 & ~v3) != 0) {
    int v4 = unk_26E8BDBC4;
  }
  else {
    int v4 = 0;
  }
  int v5 = v4 | v3;
  int v6 = dword_26E8BDBC8;
  if ((dword_26E8BDBC8 & ~v5) == 0) {
    int v6 = 0;
  }
  int v7 = v6 | v5;
  if ((unk_26E8BDBCC & ~v7) != 0) {
    int v8 = unk_26E8BDBCC;
  }
  else {
    int v8 = 0;
  }
  int v9 = v8 | v7;
  int v10 = dword_26E8BDBD0;
  if ((dword_26E8BDBD0 & ~v9) == 0) {
    int v10 = 0;
  }
  int v11 = v10 | v9;
  if ((unk_26E8BDBD4 & ~v11) != 0) {
    int v12 = unk_26E8BDBD4;
  }
  else {
    int v12 = 0;
  }
  int v13 = v12 | v11;
  int v14 = dword_26E8BDBD8;
  if ((dword_26E8BDBD8 & ~v13) == 0) {
    int v14 = 0;
  }
  int v15 = v14 | v13;
  if ((unk_26E8BDBDC & ~v15) != 0) {
    int v16 = unk_26E8BDBDC;
  }
  else {
    int v16 = 0;
  }
  int v17 = v16 | v15;
  int v18 = dword_26E8BDBE0;
  if ((dword_26E8BDBE0 & ~v17) == 0) {
    int v18 = 0;
  }
  int v19 = v18 | v17;
  if ((unk_26E8BDBE4 & ~v19) != 0) {
    int v20 = unk_26E8BDBE4;
  }
  else {
    int v20 = 0;
  }
  int v21 = v20 | v19;
  int v23 = dword_26E8BDBE8;
  int v22 = unk_26E8BDBEC;
  if ((dword_26E8BDBE8 & ~v21) == 0) {
    int v23 = 0;
  }
  int v24 = v23 | v21;
  if ((unk_26E8BDBEC & ~v24) == 0) {
    int v22 = 0;
  }
  return v22 | v24;
}

@end