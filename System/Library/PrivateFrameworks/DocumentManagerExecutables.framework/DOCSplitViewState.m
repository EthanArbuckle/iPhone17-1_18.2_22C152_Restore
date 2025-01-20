@interface DOCSplitViewState
+ (BOOL)isHideOverlayTransitionFromState:(id)a3 toState:(id)a4;
+ (BOOL)isShowOverlayTransitionFromState:(id)a3 toState:(id)a4;
- (BOOL)isCollapsed;
- (BOOL)isSidebarShown;
- (BOOL)isSidebarShownInOverlay;
- (BOOL)isSidebarShownInline;
- (DOCSplitViewState)init;
- (NSString)description;
- (id)withDisplayMode:(int64_t)a3;
- (id)withIsCollapsed:(BOOL)a3;
- (int64_t)displayMode;
@end

@implementation DOCSplitViewState

- (DOCSplitViewState)init
{
  *(_OWORD *)((char *)&self->super.isa + OBJC_IVAR___DOCSplitViewState__impl) = xmmword_22BE99C00;
  v3.receiver = self;
  v3.super_class = (Class)DOCSplitViewState;
  return [(DOCSplitViewState *)&v3 init];
}

- (BOOL)isCollapsed
{
  uint64_t v2 = *((unsigned __int8 *)&self->super.isa + OBJC_IVAR___DOCSplitViewState__impl);
  if (v2 == 2) {
    __break(1u);
  }
  else {
    LOBYTE(self) = v2 & 1;
  }
  return (char)self;
}

- (BOOL)isSidebarShownInOverlay
{
  uint64_t v2 = *((unsigned __int8 *)&self->super.isa + OBJC_IVAR___DOCSplitViewState__impl);
  if (v2 == 2) {
    __break(1u);
  }
  else {
    LOBYTE(self) = (v2 & 1) == 0 && *(void *)&self->_impl[OBJC_IVAR___DOCSplitViewState__impl] == 3;
  }
  return (char)self;
}

- (BOOL)isSidebarShownInline
{
  uint64_t v2 = *((unsigned __int8 *)&self->super.isa + OBJC_IVAR___DOCSplitViewState__impl);
  if (v2 == 2) {
    __break(1u);
  }
  else {
    LOBYTE(self) = (v2 & 1) == 0 && *(void *)&self->_impl[OBJC_IVAR___DOCSplitViewState__impl] == 2;
  }
  return (char)self;
}

- (BOOL)isSidebarShown
{
  uint64_t v2 = *((unsigned __int8 *)&self->super.isa + OBJC_IVAR___DOCSplitViewState__impl);
  if (v2 == 2) {
    __break(1u);
  }
  else {
    LOBYTE(self) = (v2 & 1) == 0
  }
                && (*(void *)&self->_impl[OBJC_IVAR___DOCSplitViewState__impl] & 0xFFFFFFFFFFFFFFFELL) == 2;
  return (char)self;
}

- (int64_t)displayMode
{
  if (*(unsigned char *)(self + OBJC_IVAR___DOCSplitViewState__impl) != 2) {
    return *(void *)(self + OBJC_IVAR___DOCSplitViewState__impl + 8);
  }
  __break(1u);
  return self;
}

- (id)withIsCollapsed:(BOOL)a3
{
  if (*((unsigned char *)self + OBJC_IVAR___DOCSplitViewState__impl) == 2)
  {
    __break(1u);
  }
  else
  {
    BOOL v3 = a3;
    id v4 = self;
    uint64_t v5 = *(void *)((char *)self + OBJC_IVAR___DOCSplitViewState__impl + 8);
    id v6 = objc_allocWithZone((Class)DOCSplitViewState);
    id v7 = v4;
    v8 = (char *)objc_msgSend(v6, sel_init);
    v9 = &v8[OBJC_IVAR___DOCSplitViewState__impl];
    *(void *)v9 = v3;
    *((void *)v9 + 1) = v5;

    return v8;
  }
  return self;
}

- (id)withDisplayMode:(int64_t)a3
{
  uint64_t v3 = *((unsigned __int8 *)self + OBJC_IVAR___DOCSplitViewState__impl);
  if (v3 == 2)
  {
    __break(1u);
  }
  else
  {
    id v5 = self;
    uint64_t v6 = v3 & 1;
    id v7 = objc_allocWithZone((Class)DOCSplitViewState);
    id v8 = v5;
    v9 = (char *)objc_msgSend(v7, sel_init);
    v10 = &v9[OBJC_IVAR___DOCSplitViewState__impl];
    *(void *)v10 = v6;
    *((void *)v10 + 1) = a3;

    return v9;
  }
  return self;
}

+ (BOOL)isHideOverlayTransitionFromState:(id)a3 toState:(id)a4
{
  return sub_22BE07A78((uint64_t)a3, (uint64_t)a4) & 1;
}

+ (BOOL)isShowOverlayTransitionFromState:(id)a3 toState:(id)a4
{
  return sub_22BE07AD4((BOOL)a3, (uint64_t)a4);
}

- (NSString)description
{
  if (*((unsigned char *)self + OBJC_IVAR___DOCSplitViewState__impl) == 2)
  {
    __break(1u);
  }
  else
  {
    sub_22BE06BFC();
    uint64_t v2 = (void *)sub_22BE92C98();
    swift_bridgeObjectRelease();
    return (NSString *)v2;
  }
  return self;
}

@end