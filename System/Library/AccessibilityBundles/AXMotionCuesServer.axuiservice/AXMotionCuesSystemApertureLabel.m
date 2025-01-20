@interface AXMotionCuesSystemApertureLabel
- (CGSize)sizeThatFits:(CGSize)a3 forLayoutMode:(int64_t)a4;
- (_TtC18AXMotionCuesServer31AXMotionCuesSystemApertureLabel)initWithCoder:(id)a3;
- (_TtC18AXMotionCuesServer31AXMotionCuesSystemApertureLabel)initWithFrame:(CGRect)a3;
@end

@implementation AXMotionCuesSystemApertureLabel

- (CGSize)sizeThatFits:(CGSize)a3 forLayoutMode:(int64_t)a4
{
  -[AXMotionCuesSystemApertureLabel sizeThatFits:](self, "sizeThatFits:", a4, a3.width, a3.height);
  result.height = v5;
  result.width = v4;
  return result;
}

- (_TtC18AXMotionCuesServer31AXMotionCuesSystemApertureLabel)initWithFrame:(CGRect)a3
{
  return (_TtC18AXMotionCuesServer31AXMotionCuesSystemApertureLabel *)sub_1287C(self, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, (uint64_t)a2, type metadata accessor for AXMotionCuesSystemApertureLabel);
}

- (_TtC18AXMotionCuesServer31AXMotionCuesSystemApertureLabel)initWithCoder:(id)a3
{
  return (_TtC18AXMotionCuesServer31AXMotionCuesSystemApertureLabel *)sub_12910(self, (uint64_t)a2, (uint64_t)a3, type metadata accessor for AXMotionCuesSystemApertureLabel, (SEL *)&selRef_initWithCoder_);
}

@end