@interface CKDebugTickHUDView
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC7ChatKitP33_1CDF9E619B3482BCE1E7C40D34D4226E18CKDebugTickHUDView)init;
- (_TtC7ChatKitP33_1CDF9E619B3482BCE1E7C40D34D4226E18CKDebugTickHUDView)initWithCoder:(id)a3;
- (_TtC7ChatKitP33_1CDF9E619B3482BCE1E7C40D34D4226E18CKDebugTickHUDView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation CKDebugTickHUDView

- (CGSize)sizeThatFits:(CGSize)a3
{
  objc_msgSend(*(id *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC7ChatKitP33_1CDF9E619B3482BCE1E7C40D34D4226E18CKDebugTickHUDView_tickCountLabel), sel_sizeThatFits_, a3.width, a3.height);
  double v4 = v3 + 6.0;
  double v6 = v5 + 6.0;
  result.height = v6;
  result.width = v4;
  return result;
}

- (_TtC7ChatKitP33_1CDF9E619B3482BCE1E7C40D34D4226E18CKDebugTickHUDView)init
{
  return (_TtC7ChatKitP33_1CDF9E619B3482BCE1E7C40D34D4226E18CKDebugTickHUDView *)sub_18F7A1B70();
}

- (_TtC7ChatKitP33_1CDF9E619B3482BCE1E7C40D34D4226E18CKDebugTickHUDView)initWithFrame:(CGRect)a3
{
  uint64_t v4 = OBJC_IVAR____TtC7ChatKitP33_1CDF9E619B3482BCE1E7C40D34D4226E18CKDebugTickHUDView_tickCountLabel;
  *(Class *)((char *)&self->super.super.super.isa + v4) = (Class)objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F42B38]), sel_init);
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC7ChatKitP33_1CDF9E619B3482BCE1E7C40D34D4226E18CKDebugTickHUDView_tickCounter) = 0;

  CGSize result = (_TtC7ChatKitP33_1CDF9E619B3482BCE1E7C40D34D4226E18CKDebugTickHUDView *)sub_18F7BA5D0();
  __break(1u);
  return result;
}

- (_TtC7ChatKitP33_1CDF9E619B3482BCE1E7C40D34D4226E18CKDebugTickHUDView)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC7ChatKitP33_1CDF9E619B3482BCE1E7C40D34D4226E18CKDebugTickHUDView_tickCountLabel;
  id v6 = objc_allocWithZone(MEMORY[0x1E4F42B38]);
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_init);
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC7ChatKitP33_1CDF9E619B3482BCE1E7C40D34D4226E18CKDebugTickHUDView_tickCounter) = 0;

  CGSize result = (_TtC7ChatKitP33_1CDF9E619B3482BCE1E7C40D34D4226E18CKDebugTickHUDView *)sub_18F7BA5D0();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for CKDebugTickHUDView();
  v2 = (char *)v5.receiver;
  [(CKDebugTickHUDView *)&v5 layoutSubviews];
  double v3 = *(void **)&v2[OBJC_IVAR____TtC7ChatKitP33_1CDF9E619B3482BCE1E7C40D34D4226E18CKDebugTickHUDView_tickCountLabel];
  objc_msgSend(v2, sel_bounds, v5.receiver, v5.super_class);
  objc_msgSend(v3, sel_setFrame_, UIEdgeInsetsInsetRect_0(v4));
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7ChatKitP33_1CDF9E619B3482BCE1E7C40D34D4226E18CKDebugTickHUDView_tickCountLabel));
}

@end