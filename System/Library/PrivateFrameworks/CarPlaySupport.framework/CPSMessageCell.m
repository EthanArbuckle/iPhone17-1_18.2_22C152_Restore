@interface CPSMessageCell
- (void)configureWithMessageListItem:(id)a3;
@end

@implementation CPSMessageCell

- (void)configureWithMessageListItem:(id)a3
{
  v23 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v9 = (void *)MEMORY[0x263F31380];
  id v20 = (id)[location[0] text];
  id v19 = (id)[location[0] detailText];
  id v18 = (id)[location[0] leadingConfiguration];
  id v17 = (id)[v18 leadingImage];
  id v16 = (id)[location[0] leadingConfiguration];
  char v6 = [v16 isUnread];
  id v15 = (id)[location[0] leadingConfiguration];
  BOOL v7 = [v15 leadingItem] == 1;
  id v14 = (id)[location[0] leadingConfiguration];
  BOOL v8 = [v14 leadingItem] == 2;
  id v13 = (id)[location[0] trailingConfiguration];
  BOOL v5 = [v13 trailingItem] == 1;
  id v12 = (id)[location[0] trailingText];
  id v11 = (id)[location[0] trailingConfiguration];
  id v10 = (id)[v11 trailingImage];
  LOBYTE(v3) = v5;
  LOBYTE(v4) = [location[0] isEnabled] & 1;
  id v21 = (id)[v9 configurationWithText:v20 detailText:v19 image:v17 unread:v6 & 1 showsPin:v7 showsStar:v8 showsMute:v3 trailingText:v12 trailingImage:v10 enabled:v4];

  [(CPUIMessageCell *)v23 applyConfiguration:v21];
  objc_storeStrong(&v21, 0);
  objc_storeStrong(location, 0);
}

@end