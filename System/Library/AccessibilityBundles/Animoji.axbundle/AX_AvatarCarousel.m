@interface AX_AvatarCarousel
- (AX_AvatarCarousel)initWithMessagesController:(id)a3 accessibilityContainer:(id)a4;
- (BOOL)_accessibilityScrollCarousel:(BOOL)a3;
- (BOOL)_accessibilitySupportsActivateAction;
- (BOOL)_axMessagesControllerIsExpanded;
- (BOOL)accessibilityScroll:(int64_t)a3;
- (BOOL)isAccessibilityElement;
- (CGRect)accessibilityFrameInContainerSpace;
- (id)_axContainerAvatarController;
- (id)accessibilityHint;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (id)messagesController;
- (int64_t)_axCurrentIndex;
- (unint64_t)accessibilityTraits;
- (void)_setAXCurrentIndex:(int64_t)a3;
- (void)accessibilityDecrement;
- (void)accessibilityIncrement;
- (void)setMessagesController:(id)a3;
@end

@implementation AX_AvatarCarousel

- (AX_AvatarCarousel)initWithMessagesController:(id)a3 accessibilityContainer:(id)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)AX_AvatarCarousel;
  v7 = [(AX_AvatarCarousel *)&v11 initWithAccessibilityContainer:a4];
  v8 = v7;
  if (v7)
  {
    [(AX_AvatarCarousel *)v7 setMessagesController:v6];
    v10 = v8;
    AXPerformSafeBlock();
  }
  return v8;
}

- (id)_axContainerAvatarController
{
  v2 = [(AX_AvatarCarousel *)self messagesController];
  v3 = [v2 safeValueForKeyPath:@"_avatarListController.multiAvatarController"];

  return v3;
}

- (BOOL)_axMessagesControllerIsExpanded
{
  v2 = [(AX_AvatarCarousel *)self messagesController];
  BOOL v3 = [v2 safeUnsignedIntegerForKey:@"presentationStyle"] == 1;

  return v3;
}

- (BOOL)isAccessibilityElement
{
  v2 = [(AX_AvatarCarousel *)self messagesController];
  uint64_t v3 = [v2 safeUnsignedIntegerForKey:@"_UIState"];

  return v3 != 1 && v3 != 4;
}

- (id)accessibilityLabel
{
  return accessibilityJellyfishLocalizedString(@"starfish.carousel");
}

- (id)accessibilityValue
{
  if ([(AX_AvatarCarousel *)self _axCurrentIndex] < 1)
  {
    v7 = accessibilityJellyfishLocalizedString(@"starfish.add");
  }
  else
  {
    uint64_t v3 = [(AX_AvatarCarousel *)self _axContainerAvatarController];
    if ([(AX_AvatarCarousel *)self _axMessagesControllerIsExpanded])
    {
      v4 = [(AX_AvatarCarousel *)self messagesController];
      v5 = [v4 safeValueForKey:@"_puppetCollectionViewController"];
      id v6 = [v5 safeValueForKey:@"selectedRecord"];
    }
    else
    {
      id v6 = [v3 safeValueForKey:@"displayedRecord"];
    }
    v8 = [MEMORY[0x263F22288] descriptionForAvatarWithRecord:v6 includeVideoPrefix:0];
    v9 = [(AX_AvatarCarousel *)self messagesController];
    v10 = [v9 safeUIViewForKey:@"_userInfoView"];

    [v10 alpha];
    if (v11 <= 0.0)
    {
      v12 = 0;
    }
    else
    {
      v12 = [v10 safeStringForKey:@"text"];
    }
    v7 = __UIAXStringForVariables();
  }

  return v7;
}

- (id)accessibilityHint
{
  v2 = [(AX_AvatarCarousel *)self messagesController];
  uint64_t v3 = [v2 safeUnsignedIntegerForKey:@"_arSessionState"];

  if (v3 == 4)
  {
    v4 = @"face.tracking.paused.hint";
    goto LABEL_5;
  }
  if (!v3)
  {
    v4 = @"emoji.puppet.hint";
LABEL_5:
    v5 = accessibilityJellyfishLocalizedString(v4);
    goto LABEL_7;
  }
  v5 = 0;
LABEL_7:

  return v5;
}

- (unint64_t)accessibilityTraits
{
  v7.receiver = self;
  v7.super_class = (Class)AX_AvatarCarousel;
  unint64_t v3 = [(AX_AvatarCarousel *)&v7 accessibilityTraits];
  BOOL v4 = [(AX_AvatarCarousel *)self _axMessagesControllerIsExpanded];
  uint64_t v5 = *MEMORY[0x263F1CED8];
  if (v4) {
    uint64_t v5 = 0;
  }
  return v5 | v3;
}

- (BOOL)_accessibilityScrollCarousel:(BOOL)a3
{
  unint64_t v3 = self;
  BOOL v4 = [(AX_AvatarCarousel *)self _axContainerAvatarController];
  [(AX_AvatarCarousel *)v3 _axCurrentIndex];
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  id v6 = v4;
  AXPerformSafeBlock();
  LOBYTE(v3) = *((unsigned char *)v8 + 24);

  _Block_object_dispose(&v7, 8);
  return (char)v3;
}

- (BOOL)accessibilityScroll:(int64_t)a3
{
  if (a3 == 1)
  {
    uint64_t v5 = 0;
    return [(AX_AvatarCarousel *)self _accessibilityScrollCarousel:v5];
  }
  if (a3 == 2)
  {
    uint64_t v5 = 1;
    return [(AX_AvatarCarousel *)self _accessibilityScrollCarousel:v5];
  }
  uint64_t v8 = v3;
  uint64_t v9 = v4;
  v7.receiver = self;
  v7.super_class = (Class)AX_AvatarCarousel;
  return -[AX_AvatarCarousel accessibilityScroll:](&v7, sel_accessibilityScroll_);
}

- (int64_t)_axCurrentIndex
{
  return MEMORY[0x270F0A458](self, &__AX_AvatarCarousel___axCurrentIndex);
}

- (void)_setAXCurrentIndex:(int64_t)a3
{
}

- (void)accessibilityIncrement
{
}

- (void)accessibilityDecrement
{
}

- (CGRect)accessibilityFrameInContainerSpace
{
  v2 = [(AX_AvatarCarousel *)self accessibilityContainer];
  [v2 frame];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (BOOL)_accessibilitySupportsActivateAction
{
  return 1;
}

- (id)messagesController
{
  id WeakRetained = objc_loadWeakRetained(&self->_messagesController);

  return WeakRetained;
}

- (void)setMessagesController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end