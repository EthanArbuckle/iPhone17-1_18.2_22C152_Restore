@interface ClimateAutoModeLevelButton
- (BOOL)isHighlighted;
- (void)autoClimateControlService:(id)a3 didUpdateLevel:(unsigned __int8)a4;
- (void)setHighlighted:(BOOL)a3;
@end

@implementation ClimateAutoModeLevelButton

- (BOOL)isHighlighted
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ClimateAutoModeLevelButton();
  return [(ClimateButton *)&v3 isHighlighted];
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for ClimateAutoModeLevelButton();
  v4 = (char *)v7.receiver;
  [(ClimateButton *)&v7 setHighlighted:v3];
  v5 = *(void **)&v4[OBJC_IVAR____TtC7Climate26ClimateAutoModeLevelButton_progressView];
  if (v4[OBJC_IVAR____TtC7Climate13ClimateButton_shouldBeHighlighted]) {
    uint64_t v6 = 1;
  }
  else {
    uint64_t v6 = [v4 isHighlighted];
  }
  (*(void (**)(uint64_t))((swift_isaMask & *v5) + 0xB8))(v6);
}

- (void)autoClimateControlService:(id)a3 didUpdateLevel:(unsigned __int8)a4
{
  uint64_t v4 = a4;
  uint64_t v6 = *(void (**)(uint64_t))((**(void **)((char *)&self->super.super.super.super.super.super.super.super.isa
                                                     + OBJC_IVAR____TtC7Climate26ClimateAutoModeLevelButton_progressView) & swift_isaMask)
                                      + 0x88);
  id v7 = a3;
  v8 = self;
  v6(v4);
  v9.receiver = v8;
  v9.super_class = (Class)type metadata accessor for ClimateAutoModeLevelButton();
  [(ClimateAutoControlServiceButton *)&v9 autoClimateControlService:v7 didUpdateLevel:v4];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7Climate26ClimateAutoModeLevelButton_progressView));
}

@end