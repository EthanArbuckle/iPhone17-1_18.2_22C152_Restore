@interface CCUIAccessoryButton
- (BOOL)_shouldAnimatePropertyWithKey:(id)a3;
- (BOOL)isEnabled;
- (BOOL)isHighlighted;
- (CCUIAccessoryButton)initWithCoder:(id)a3;
- (CCUIAccessoryButton)initWithFrame:(CGRect)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setHighlighted:(BOOL)a3;
@end

@implementation CCUIAccessoryButton

- (BOOL)_shouldAnimatePropertyWithKey:(id)a3
{
  if (a3)
  {
    uint64_t v4 = sub_1D7BB7258();
    uint64_t v6 = v5;
    v7 = self;
    v8 = (void *)sub_1D7BB7228();
  }
  else
  {
    v9 = self;
    v8 = 0;
    uint64_t v4 = 0;
    uint64_t v6 = 0;
  }
  v13.receiver = self;
  v13.super_class = (Class)type metadata accessor for AccessoryButton();
  unsigned int v10 = [(CCUIAccessoryButton *)&v13 _shouldAnimatePropertyWithKey:v8];

  if (v10) {
    goto LABEL_9;
  }
  if (qword_1EBDFF8A0 != -1)
  {
    swift_once();
    if (v6) {
      goto LABEL_7;
    }
LABEL_12:

    char v11 = 0;
    return v11 & 1;
  }
  if (!v6) {
    goto LABEL_12;
  }
LABEL_7:
  if (v4 != qword_1EBDFF890 || v6 != *(void *)algn_1EBDFF898)
  {
    char v11 = sub_1D7BB7948();

    swift_bridgeObjectRelease();
    return v11 & 1;
  }
LABEL_9:

  swift_bridgeObjectRelease();
  char v11 = 1;
  return v11 & 1;
}

- (BOOL)isEnabled
{
  return sub_1D7B6F16C(self, (uint64_t)a2, (SEL *)&selRef_isEnabled);
}

- (void)setEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = (objc_class *)type metadata accessor for AccessoryButton();
  v9.receiver = self;
  v9.super_class = v5;
  uint64_t v6 = self;
  char v7 = [(CCUIAccessoryButton *)&v9 isEnabled];
  v8.receiver = v6;
  v8.super_class = v5;
  [(CCUIAccessoryButton *)&v8 setEnabled:v3];
  sub_1D7B6E99C(v7);
}

- (BOOL)isHighlighted
{
  return sub_1D7B6F16C(self, (uint64_t)a2, (SEL *)&selRef_isHighlighted);
}

- (void)setHighlighted:(BOOL)a3
{
  uint64_t v4 = self;
  sub_1D7B6F200(a3);
}

- (CCUIAccessoryButton)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for AccessoryButton();
  return -[CCUIAccessoryButton initWithFrame:](&v8, sel_initWithFrame_, x, y, width, height);
}

- (CCUIAccessoryButton)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for AccessoryButton();
  return [(CCUIAccessoryButton *)&v5 initWithCoder:a3];
}

@end