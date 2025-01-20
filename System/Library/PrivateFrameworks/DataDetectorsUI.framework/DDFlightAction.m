@interface DDFlightAction
- (BOOL)extractAirlineCode:(id *)a3 flightNumber:(int64_t *)a4;
- (id)iconName;
- (id)localizedName;
- (id)quickActionTitle;
- (id)viewController;
- (int)interactionType;
- (void)adaptForPresentationInPopover:(BOOL)a3;
- (void)closePressed;
- (void)prepareViewControllerForActionController:(id)a3;
@end

@implementation DDFlightAction

- (void)adaptForPresentationInPopover:(BOOL)a3
{
}

- (void)prepareViewControllerForActionController:(id)a3
{
  v11[1] = *MEMORY[0x1E4F143B8];
  v10.receiver = self;
  v10.super_class = (Class)DDFlightAction;
  id v4 = a3;
  [(DDAction *)&v10 prepareViewControllerForActionController:v4];
  id v5 = objc_alloc(MEMORY[0x1E4F427C0]);
  v6 = objc_msgSend(v5, "initWithBarButtonSystemItem:target:action:", 0, self, sel_closePressed, v10.receiver, v10.super_class);
  v11[0] = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
  v8 = [(UINavigationController *)self->_viewController topViewController];
  v9 = [v8 navigationItem];
  [v9 setRightBarButtonItems:v7];

  -[DDFlightAction adaptForPresentationInPopover:](self, "adaptForPresentationInPopover:", [v4 isPresentingInPopover]);
  [v4 action:self presentationShouldBeModal:0];
}

- (id)localizedName
{
  return DDLocalizedString(@"Preview Flight");
}

- (id)iconName
{
  return @"airplane";
}

- (id)quickActionTitle
{
  id v9 = 0;
  uint64_t v10 = 0;
  BOOL v3 = [(DDFlightAction *)self extractAirlineCode:&v9 flightNumber:&v10];
  id v4 = v9;
  if (v3)
  {
    uint64_t v5 = [NSString stringWithFormat:@"%@%ld", v4, v10];
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)DDFlightAction;
    uint64_t v5 = [(DDAction *)&v8 quickActionTitle];
  }
  v6 = (void *)v5;

  return v6;
}

- (int)interactionType
{
  return 1;
}

- (void)closePressed
{
  id v3 = [(DDAction *)self delegate];
  [v3 actionDidFinish:self];
}

- (BOOL)extractAirlineCode:(id *)a3 flightNumber:(int64_t *)a4
{
  v6 = [(DDAction *)self result];
  if (v6)
  {
    CFStringRef Type = (const __CFString *)DDResultGetType();
    if (CFStringCompare(Type, (CFStringRef)*MEMORY[0x1E4F5F000], 0))
    {
      LOBYTE(v6) = 0;
    }
    else
    {
      SubresultWithCFStringRef Type = DDResultGetSubresultWithType();
      uint64_t v9 = DDResultGetSubresultWithType();
      if (SubresultWithType) {
        BOOL v13 = v9 == 0;
      }
      else {
        BOOL v13 = 1;
      }
      if (v13) {
        DDUILogAssertionFailure((uint64_t)"(airlineCodeSubResult != NULL) && (flightNumberSubResult != NULL)", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/MobileDataDetectorsUI/Actions/DDFlightAction.m", (uint64_t)"-[DDFlightAction extractAirlineCode:flightNumber:]", 97, @"Flight information without airline code or flight number", v10, v11, v12, v15);
      }
      DDResultGetValue();
      *a3 = (id)objc_claimAutoreleasedReturnValue();
      *a4 = [(id)DDResultGetValue() integerValue];
      LOBYTE(v6) = 1;
    }
  }
  return (char)v6;
}

- (id)viewController
{
  v19[1] = *MEMORY[0x1E4F143B8];
  p_viewController = &self->_viewController;
  viewController = self->_viewController;
  if (!viewController)
  {
    id v17 = 0;
    uint64_t v18 = 0;
    [(DDFlightAction *)self extractAirlineCode:&v17 flightNumber:&v18];
    id v5 = v17;
    gotLoadHelper_x8__OBJC_CLASS___FUFlightViewController(v6);
    id v8 = objc_alloc(*(Class *)(v7 + 544));
    uint64_t v9 = (void *)[v8 initWithFlightCode:v18 airlineCode:v5];
    uint64_t v10 = objc_alloc_init(DDAutoCloseNavigationController);
    [(DDAutoCloseNavigationController *)v10 pushViewController:v9 animated:0];
    [(DDAutoCloseNavigationController *)v10 setNavigationBarHidden:0];
    [(DDAutoCloseNavigationController *)v10 setTarget:self];
    uint64_t v11 = (void *)[objc_alloc(MEMORY[0x1E4F427C0]) initWithBarButtonSystemItem:0 target:v10 action:sel_closePressed];
    v19[0] = v11;
    uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];
    BOOL v13 = [v9 navigationItem];
    [v13 setRightBarButtonItems:v12];

    objc_storeStrong((id *)p_viewController, v10);
    v14 = [MEMORY[0x1E4F42948] currentDevice];
    unint64_t v15 = [v14 userInterfaceIdiom];

    if (v15 <= 6 && ((1 << v15) & 0x62) != 0) {
      [(UINavigationController *)*p_viewController setModalPresentationStyle:7];
    }

    viewController = *p_viewController;
  }
  return viewController;
}

- (void).cxx_destruct
{
}

@end