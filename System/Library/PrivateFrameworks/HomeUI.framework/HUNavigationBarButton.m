@interface HUNavigationBarButton
+ (id)addButtonWithOwner:(id)a3;
+ (id)announceButtonWithOwner:(id)a3;
+ (id)editDoneButtonWithOwner:(id)a3;
+ (id)homeButtonWithOwner:(id)a3;
- (HUNavigationBarButton)init;
- (HUNavigationBarButton)initWithCoder:(id)a3;
- (HUNavigationBarButtonOwner)owner;
- (NSNumber)badgeValue;
- (NSString)description;
- (NSString)identifier;
- (SEL)action;
- (UIFont)font;
- (UIMenu)menu;
- (id)target;
- (void)handleTap:(id)a3;
- (void)performAction;
- (void)setAction:(SEL)a3;
- (void)setBadgeValue:(id)a3;
- (void)setFont:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setMenu:(id)a3;
- (void)setOwner:(id)a3;
- (void)setTarget:(id)a3;
@end

@implementation HUNavigationBarButton

- (HUNavigationBarButton)init
{
  return (HUNavigationBarButton *)sub_1BE526BF8();
}

- (HUNavigationBarButton)initWithCoder:(id)a3
{
  return (HUNavigationBarButton *)sub_1BE526CD0(a3);
}

- (NSString)description
{
  v2 = self;
  sub_1BE526E30();

  v3 = (void *)sub_1BE9C49B8();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

- (id)target
{
  return sub_1BE527194(self, (uint64_t)a2, (SEL *)&selRef_target);
}

- (void)setTarget:(id)a3
{
  swift_unknownObjectRetain();
  v5 = self;
  sub_1BE529630((uint64_t)a3);

  swift_unknownObjectRelease();
}

- (SEL)action
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for NavigationBarButton();
  return [(HUNavigationBarButton *)&v3 action];
}

- (void)setAction:(SEL)a3
{
  v4 = self;
  sub_1BE527094((uint64_t)a3);
}

- (UIMenu)menu
{
  return (UIMenu *)sub_1BE527194(self, (uint64_t)a2, (SEL *)&selRef_menu);
}

- (void)setMenu:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for NavigationBarButton();
  id v4 = a3;
  id v5 = v6.receiver;
  [(HUNavigationBarButton *)&v6 setMenu:v4];
  sub_1BE52725C();
}

- (NSString)identifier
{
  v2 = (char *)self + OBJC_IVAR___HUNavigationBarButton_identifier;
  swift_beginAccess();
  if (*((void *)v2 + 1))
  {
    sub_1BE9C36A8();
    objc_super v3 = (void *)sub_1BE9C49B8();
    swift_bridgeObjectRelease();
  }
  else
  {
    objc_super v3 = 0;
  }

  return (NSString *)v3;
}

- (void)setIdentifier:(id)a3
{
  if (a3)
  {
    uint64_t v4 = sub_1BE9C49F8();
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v6 = 0;
  }
  v7 = (uint64_t *)((char *)self + OBJC_IVAR___HUNavigationBarButton_identifier);
  swift_beginAccess();
  uint64_t *v7 = v4;
  v7[1] = v6;
  swift_bridgeObjectRelease();
}

- (HUNavigationBarButtonOwner)owner
{
  v2 = (char *)self + OBJC_IVAR___HUNavigationBarButton_owner;
  swift_beginAccess();
  objc_super v3 = (void *)MEMORY[0x1C1898E00](v2);

  return (HUNavigationBarButtonOwner *)v3;
}

- (void)setOwner:(id)a3
{
}

- (NSNumber)badgeValue
{
  v2 = (id *)((char *)&self->super.super.super.isa + OBJC_IVAR___HUNavigationBarButton_badgeValue);
  swift_beginAccess();
  return (NSNumber *)*v2;
}

- (void)setBadgeValue:(id)a3
{
  uint64_t v5 = (void **)((char *)&self->super.super.super.isa + OBJC_IVAR___HUNavigationBarButton_badgeValue);
  swift_beginAccess();
  uint64_t v6 = *v5;
  HUNavigationBarButton *v5 = a3;
  id v7 = a3;
  v8 = self;
  sub_1BE5279D8(v6);
}

- (UIFont)font
{
  v2 = self;
  objc_super v3 = (void *)sub_1BE527C78();

  return (UIFont *)v3;
}

- (void)setFont:(id)a3
{
  id v5 = a3;
  uint64_t v6 = self;
  sub_1BE527E48(a3);
}

- (void)handleTap:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_1BE529834();
}

- (void)performAction
{
  v2 = *(void (**)(HUNavigationBarButton *))((char *)&self->super.super.super.isa
                                                      + OBJC_IVAR___HUNavigationBarButton_actionHandler);
  if (v2)
  {
    objc_super v3 = self;
    sub_1BE3F5604((uint64_t)v2);
    v2(v3);
    sub_1BE3B21C0((uint64_t)v2);
  }
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  sub_1BE37E904((uint64_t)self + OBJC_IVAR___HUNavigationBarButton_owner);

  sub_1BE3B21C0(*(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR___HUNavigationBarButton_actionHandler));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___HUNavigationBarButton____lazy_storage___tapGestureRecognizer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___HUNavigationBarButton____lazy_storage___badgeSpacerView));
  objc_super v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___HUNavigationBarButton____lazy_storage___badgeView);
}

+ (id)addButtonWithOwner:(id)a3
{
  return sub_1BE5295D8((uint64_t)a1, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(uint64_t))_s6HomeUI19NavigationBarButtonC03addE04withAcA0cdE5Owner_p_tFZ_0);
}

+ (id)announceButtonWithOwner:(id)a3
{
  return sub_1BE5295D8((uint64_t)a1, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(uint64_t))_s6HomeUI19NavigationBarButtonC08announceE04withAcA0cdE5Owner_p_tFZ_0);
}

+ (id)editDoneButtonWithOwner:(id)a3
{
  return sub_1BE5295D8((uint64_t)a1, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(uint64_t))_s6HomeUI19NavigationBarButtonC08editDoneE04withAcA0cdE5Owner_p_tFZ_0);
}

+ (id)homeButtonWithOwner:(id)a3
{
  return sub_1BE5295D8((uint64_t)a1, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(uint64_t))_s6HomeUI19NavigationBarButtonC04homeE04withAcA0cdE5Owner_p_tFZ_0);
}

@end