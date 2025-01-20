@interface VisionPrescriptionPreviewTableViewCell
- (_TtC21VisionHealthAppPlugin38VisionPrescriptionPreviewTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (_TtC21VisionHealthAppPlugin38VisionPrescriptionPreviewTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 presentationOptions:(int64_t)a5;
@end

@implementation VisionPrescriptionPreviewTableViewCell

- (_TtC21VisionHealthAppPlugin38VisionPrescriptionPreviewTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  if (a4)
  {
    sub_241DAA990();
    v6 = (void *)sub_241DAA950();
    swift_bridgeObjectRelease();
  }
  else
  {
    v6 = 0;
  }
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for VisionPrescriptionPreviewTableViewCell();
  v7 = [(HKObjectPickerTableViewCell *)&v9 initWithStyle:a3 reuseIdentifier:v6 presentationOptions:0];

  return v7;
}

- (_TtC21VisionHealthAppPlugin38VisionPrescriptionPreviewTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 presentationOptions:(int64_t)a5
{
  result = (_TtC21VisionHealthAppPlugin38VisionPrescriptionPreviewTableViewCell *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end